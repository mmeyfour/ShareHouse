//
//  IsRentedButtonTableViewCell.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import UIKit

protocol HouseIsRentedButtonTableViewCellDelegate {
    func houseDidTappedIsRentedButton()
}

class IsRentedButtonTableViewCell: UITableViewCell {

    static let identifier = "IsRentedButtonTableViewCell"
    var delegate:HouseIsRentedButtonTableViewCellDelegate?
    
    @IBOutlet weak var isRentedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    func configure(with isRented: Bool) {
        print("TAG: \(isRented)")
        UpdateUI(isRented: isRented)
        isRentedButton.backgroundColor = .green
        
    }
    func UpdateUI(isRented: Bool) {
        isRented ? isRentedButton.setTitle("Not Available", for: .normal) : isRentedButton.setTitle("Available", for: .normal)
    }
    @IBAction func didTappedIsRentedButton(_ sender: UIButton) {
        delegate?.houseDidTappedIsRentedButton()
    }
}
