//
//  HouseDetailDataSource.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import Foundation
import UIKit

class HouseDetailDataSource: NSObject {
    private let houseViewModel: HouseDetail?
    
    var houseName: String {
        
        return houseViewModel?.name ?? "Por defecto"
    }
    
    override init() {
        houseViewModel = HouseDetailDataSource.getHouse()
        //        print("********************************")
        //        print(houseViewModel)
        //        print("********************************")
    }
    
    static func getHouse() -> HouseDetail? {
        guard let url = Bundle.main.url(forResource: "HouseDetails", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            
            return nil
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
        guard let house = try? decoder.decode(HouseDetail.self, from: data) else {
            return nil
        }
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
        print("El propietario \(house.realtor) a fecha de \(dateFormatterPrint.string(from: house.dateAdded)) alquila el apartamento en \(house.name) con \(house.floorArea) m^2 al precio de \(house.monthlyPrice) €/mes")
        return house
    }
    
    private func configureDetailCell(from house: HouseDetail, cell: UITableViewCell) -> UITableViewCell {
        guard let namedCell = cell as? HouseDetailsTableViewCell else {
            fatalError("Unexpected cell")
        }
        namedCell.configure(with: house.name, price: house.monthlyPrice, area: house.floorArea, rooms: house.rooms)
        print("\(house.name), \(house.monthlyPrice), \(house.floorArea), \(house.rooms)")
        return namedCell
    }
    
    //    private func configureImagesCell(from house: HouseDetail, cell: UITableViewCell) -> UITableViewCell {
    //        guard let imagesCell = cell as? HouseImageTableViewCell else {
    //            fatalError("Unexpected cell")
    //        }
    //        imagesCell.configure(with: house.image)
    //        return imagesCell
    //    }
    
    private func configureDescriptionCell(from house: HouseDetail, cell: UITableViewCell) -> UITableViewCell {
        guard let descriptionCell = cell as? HouseDescriptionTableViewCell else {
            fatalError("Unexpected cell")
        }
        descriptionCell.configure(with: house.description)
        return descriptionCell
    }
    
}

extension HouseDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let houseViewModel = houseViewModel else {
            fatalError("Mising a view model")
        }
        let rowIndex = indexPath.row
        switch rowIndex {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: HouseDetailsTableViewCell.identifier, for: indexPath)
                return configureDetailCell(from: houseViewModel, cell: cell)
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: HouseDescriptionTableViewCell.identifier, for: indexPath)
                return configureDescriptionCell(from: houseViewModel, cell: cell)
                
//            case 2:
//                let cell = tableView.dequeueReusableCell(withIdentifier: HouseImageTableViewCell.identifier, for: indexPath)
//                return configureImagesCell(from: houseViewModel, cell: cell)
            default:
                fatalError("Unexpected cell")
        }
    }
}
