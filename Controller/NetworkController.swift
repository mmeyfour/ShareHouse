//
//  NetworkController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import UIKit
import Foundation

protocol HouseListDelegate {
    func didFetch(houses: [HouseSummaryViewModel])
}

class NetworkController: NSObject {
    private let session: URLSession
    private var decoder: JSONDecoder
    private let delegate: HouseListDelegate
    private var houseListDataTask: URLSessionDataTask?
    
    init(session: URLSession, houseListDelegate: HouseListDelegate) {
        self.session = session
        self.delegate = houseListDelegate
        
        let dateFormatterGet = DateFormatter()
       dateFormatterGet.dateFormat = "yyyy-MM-dd"
        decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
    }
    
    func fetchHouseList() {
        let request = URLRequest(url: HouseAPI.houseURL)
        houseListDataTask = session.dataTask(with: request) { (data, _, _) in
                        guard let data = data else {
                
                return
            }
            

            let malagaRentalList = try! self.decoder.decode([String:HouseDetail].self, from: data)
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "dd MMMM yyyy"
                    for (key, value) in malagaRentalList {
                        print("\(key): \(value)")
                    }
            let houses = malagaRentalList.map {(key, house)  in
                HouseSummaryViewModel(image: UIImage.mainImage(houseId: "house"), name: house.name, realtor: house.realtor, monthlyPrice: house.monthlyPrice, rooms: house.rooms, floorArea: house.floorArea, description: house.description, dateAdded: house.dateAdded, location: house.location, isRented: house.isRented)
            }
            print("++++++++++++++++++++++++++++++++")
            print(houses)
            print("++++++++++++++++++++++++++++++++")
            DispatchQueue.main.async {
                self.delegate.didFetch(houses: houses)
            }
        }
        houseListDataTask?.resume()
    }
}
