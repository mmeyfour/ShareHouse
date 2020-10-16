//
//  HouseDescriptionTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class HouseDescriptionTableViewCell: UITableViewCell {
    
    static let identifier = "HouseDescriptionTableViewCell"
    
    @IBOutlet weak var houseDescriptionTextLabel: UILabel!
    
    func configure(with description: String) {
        
        houseDescriptionTextLabel.text = "Description: \n \(description)"
    }
    
}
