//
//  HouseDetailDataSource.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import Foundation
import UIKit

class HouseDetailDataSource: NSObject {
    
    let house: HouseSummaryViewModel
    
    init(house: HouseSummaryViewModel) {
        self.house = house
        super.init()
    }
    
    private func configureDetailCell(from house: HouseSummaryViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let namedCell = cell as? HouseDetailsTableViewCell else {
            fatalError("Unexpected cell")
        }
        namedCell.configure(with: house.name, price: house.monthlyPrice, area: house.floorArea, rooms: house.rooms)
        print("\(house.name), \(house.monthlyPrice), \(house.floorArea), \(house.rooms)")
        return namedCell
    }
    
    private func configureImagesCell(from house: HouseSummaryViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let imagesCell = cell as? HouseImageTableViewCell else {
            fatalError("Unexpected cell")
        }
        house.isRented ? imagesCell.configure(with: #imageLiteral(resourceName: "rented.png")) : imagesCell.configure(with: #imageLiteral(resourceName: "house.png"))
        if house.isRented {
            print("No Disponible")
        } else if !house.isRented {
            print("Disponible")
        }
        // imagesCell.configure(with: #imageLiteral(resourceName: "house.png"))
        return imagesCell
    }
    
    private func configureDescriptionCell(from house: HouseSummaryViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let descriptionCell = cell as? HouseDescriptionTableViewCell else {
            fatalError("Unexpected cell")
        }
        descriptionCell.configure(with: house.description)
        return descriptionCell
    }
    
    private func configureButtonCell(from house: HouseSummaryViewModel, cell: UITableViewCell) -> UITableViewCell {
        guard let buttonCell = cell as? IsRentedButtonTableViewCell else {
            fatalError("Unexpected cell")
        }
        buttonCell.configure(with: house.isRented)
        return buttonCell
    }
    
}

extension HouseDetailDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let houseViewModel = house
        let rowIndex = indexPath.row
        switch rowIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HouseImageTableViewCell.identifier, for: indexPath)
            return configureImagesCell(from: houseViewModel, cell: cell)
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HouseDetailsTableViewCell.identifier, for: indexPath)
            return configureDetailCell(from: houseViewModel, cell: cell)
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HouseDescriptionTableViewCell.identifier, for: indexPath)
            return configureDescriptionCell(from: houseViewModel, cell: cell)
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: IsRentedButtonTableViewCell.identifier, for: indexPath)
            return configureButtonCell(from: houseViewModel, cell: cell)
        default:
            fatalError("Unexpected cell")
        }
    }
}
