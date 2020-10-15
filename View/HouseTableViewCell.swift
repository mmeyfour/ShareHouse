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
    @IBOutlet weak var houseImageView: UIImageView!
    @IBOutlet weak var houseDirectionTextLabel: UILabel!
    @IBOutlet weak var housePriceTextLabel: UILabel!
    @IBOutlet weak var houseAreaTextLabel: UILabel!
    
    // nuevo
    func configure(houseSummary: HouseSummaryViewModel) {
        houseDirectionTextLabel.text = houseSummary.name
        houseImageView.image = houseSummary.image
        housePriceTextLabel.text = "\(houseSummary.monthlyPrice) €/month"
        houseAreaTextLabel.text = "\(houseSummary.floorArea) m^2, \(houseSummary.rooms)rooms"
    }
}
