//
//  HouseDetailViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import UIKit

class HouseDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let houseDetailDataSource = HouseDetailDataSource()
    static let segueIdentifier = "ShowHouseDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()

        print(houseDetailDataSource.houseName)
    }
    
    func  setupTableView() {
        // 1. Register cell types
        let identifiers = [HouseImageTableViewCell.identifier, HouseDetailsTableViewCell.identifier, HouseDescriptionTableViewCell.identifier, IsRentedButtonTableViewCell.identifier]
        for identifier in identifiers {
            let nib = UINib(nibName: identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
        
        // 2. Connect data source
        tableView.dataSource = houseDetailDataSource
        
        // 3. Disable separator
        tableView.separatorStyle = .none
        
        // 4. Connect delegate
       
    }
}
