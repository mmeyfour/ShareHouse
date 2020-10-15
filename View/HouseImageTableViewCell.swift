//
//  HouseImageTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 15/10/2020.
//

import UIKit

class HouseImageTableViewCell: UITableViewCell {
    
    static let identifier = "HouseImageTableViewCell"
    @IBOutlet weak var houseImageView: UIImageView!
    
    func configure(with image: UIImage) {
        // load images
        houseImageView.image = image
        }
    }
