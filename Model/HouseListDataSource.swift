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
    
    init(houses: [HouseSummaryViewModel]) {
        self.houses = houses
        super.init()
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
