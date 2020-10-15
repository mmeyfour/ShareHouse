//
//  HouseListDataSource.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

class HouseListDataSource: NSObject {
    let houses: [HouseSummaryViewModel]
    
    override init(){
        houses = HouseListDataSource.getHouse()
        super.init()
    }
    
    static func getHouse() -> [HouseSummaryViewModel] {
        guard let url = Bundle.main.url(forResource: "HouseList", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            return []
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
        let malagaRentalList = try! decoder.decode([String:HouseDetail].self, from: data)
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
//        for (key, value) in malagaRentalList {
//            print("\(key): \(value)")
//        }
        let houses = malagaRentalList.map {(key, house)  in
            HouseSummaryViewModel(image: UIImage.mainImage(houseId: "1"), name: house.name, realtor: house.realtor, monthlyPrice: house.monthlyPrice, rooms: house.rooms, floorArea: house.floorArea, description: house.description, dateAdded: house.dateAdded, location: house.location)
        }
        return houses
    }
}

extension HouseListDataSource: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        1. Dequeue cell
        guard let houseCell = tableView.dequeueReusableCell(withIdentifier: HouseTableViewCell.identifier, for: indexPath) as? HouseTableViewCell else {
            fatalError("Wrong type of cell")
        }
        
        //        2. Prepare cell
        let currentHouse = houses[indexPath.row]
        houseCell.configure(houseSummary: currentHouse)
        
        //        3. Return configured cell
        return houseCell
    }
    
}
