//
//  IsRentedButtonTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import UIKit

class IsRentedButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var isRentedButton: UIButton!
    static let identifier = "IsRentedButtonTableViewCell"
    
    func configure(with isRented: Bool) {
        
        isRented ? (isRentedButton.titleLabel?.text = "Alquilado") : (isRentedButton.titleLabel?.text = "Disponible")
    }
}
