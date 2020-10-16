//
//  HouseDetailsTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class HouseDetailsTableViewCell: UITableViewCell {
    
    static let identifier = "HouseDetailsTableViewCell"
    
    @IBOutlet weak var houseAdressTextLabel: UILabel!
    @IBOutlet weak var housePriceTextLabel: UILabel!
    @IBOutlet weak var houseAreaTextLabel: UILabel!
    
    func configure(with adress: String, price: Int, area: Int, rooms: Int) {
        
        housePriceTextLabel.text = "\(price) €/month"
        houseAreaTextLabel.text = "\(area)^2, \(rooms) rooms "
    }
}
