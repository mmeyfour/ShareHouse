//
//  HouseDetailViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import UIKit

class HouseDetailViewController: UIViewController {

    lazy var networkController = HouseNetworkController(session: URLSession(configuration: .default), houseDetailDelegate: self)
    var houseDetailDataSource: HouseDetailDataSource?
    static let segueIdentifier = "ShowHouseDetail"
    var selectedHouse: String?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ID : \(selectedHouse!)")
        setupTableView()
        networkController.fetchHouseList(houseID: selectedHouse!)
        
    }
    
    func  setupTableView() {
        // 1. Register cell types
        let identifiers = [HouseImageTableViewCell.identifier, HouseDetailsTableViewCell.identifier, HouseDescriptionTableViewCell.identifier, IsRentedButtonTableViewCell.identifier]
        for identifier in identifiers {
            let nib = UINib(nibName: identifier, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: identifier)
        }
        
        // 3. Disable separator
        tableView.separatorStyle = .none
        
        // 4. Connect delegate
        tableView.delegate = self
    }
}

extension HouseDetailViewController: HouseDetailDelegate {
    func didFetch(house: HouseSummaryViewModel) {
        houseDetailDataSource = HouseDetailDataSource(house: house)
        tableView.dataSource = houseDetailDataSource
        tableView.reloadData()
    }
}

extension HouseDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let buttonCell = cell as? IsRentedButtonTableViewCell else { return }
        buttonCell.delegate = self
    }
}

extension HouseDetailViewController: HouseIsRentedButtonTableViewCellDelegate{
    func houseDidTappedIsRentedButton() {
        print("alquilado !!!!!!!!!")
    }
}
