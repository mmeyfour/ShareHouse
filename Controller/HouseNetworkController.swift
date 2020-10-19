//
//  HouseNetworkController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 19/10/2020.
//

import UIKit
import Foundation

protocol HouseDetailDelegate {
    func didFetch(house: HouseSummaryViewModel)
}

class HouseNetworkController: NSObject {

    private let session: URLSession
    private var decoder: JSONDecoder
    private let delegate: HouseDetailDelegate
    private var houseDetailDataTask: URLSessionDataTask?
    var selectedHouse: HouseSummaryViewModel?
    
    init(session: URLSession, houseDetailDelegate: HouseDetailDelegate) {
        self.session = session
        self.delegate = houseDetailDelegate
        
        let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd"
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
    }
    
    func fetchHouseList(houseID: String) {
        let request = URLRequest(url: HouseAPI.houseURL)
        houseDetailDataTask = session.dataTask(with: request) { (data, _, _) in
                        guard let data = data else {
                return
            }
            
            let malagaRentalList = try! self.decoder.decode([String:HouseDetail].self, from: data)
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd MMMM yyyy"
                    for (key, value) in malagaRentalList {
                        print("\(key): \(value)")
                        if houseID == key {
                            let house = HouseSummaryViewModel(id: key, image: UIImage.mainImage(houseId: "house"), name: value.name, realtor: value.realtor, monthlyPrice: value.monthlyPrice, rooms: value.rooms, floorArea: value.floorArea, description: value.description, dateAdded: value.dateAdded, location: value.location, isRented: value.isRented)
                            self.selectedHouse = house
                        }
                    }
            
            print("la casa seleccionada es TAG : \(self.selectedHouse)")
            DispatchQueue.main.async {
                self.delegate.didFetch(house: self.selectedHouse!)
            }
        }
        houseDetailDataTask?.resume()
    }
    
}
