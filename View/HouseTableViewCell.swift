//
//  HouseTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit

class HouseTableViewCell: UITableViewCell {
    
//    MARK: States
    static let identifier = "HouseTableViewCell"
    
    //    MARK: Outlets
    @IBOutlet weak var houseImage: UIImageView!
    @IBOutlet weak var houseDirection: UILabel!
    
    // nuevo
    func configure(houseSummary: HouseSummaryViewModel) {
        houseDirection.text = houseSummary.name
        houseImage.image = houseSummary.image
    }

    
}
