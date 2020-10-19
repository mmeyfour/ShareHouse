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
    var selectedHouse: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ID : \(selectedHouse!)")
        setupTableView()
//        let house = NetworkController.fechHouseDetail(selectedHouse)

        //print(houseDetailDataSource.houseName)
        
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
//
//extension HouseDetailViewController: HouseDetailDelegate {
//
//    func didFetchHouse(house: HouseSummaryViewModel) {
//
////        houseListDataSource = HouseListDataSource(houses: houses)
////        tableView.dataSource = houseListDataSource
////        tableView.reloadData()
////
////        for house in houseListDataSource!.houses {
////            print(house.name)
////            print(house.dateAdded)
////            print(house.description)
////            print(house.floorArea)
////            print(house.image)
////            print(house.location)
////            print(house.monthlyPrice)
////            print(house.realtor)
////            print(house.rooms)
////            print(house.isRented)
////            print("-----------------------------------")
////            let Point = MapPoint(
////                title: "\(house.realtor)",
////                locationName: "\(house.name)",
////                discipline: "House",
////                coordinate: CLLocationCoordinate2D(latitude: house.location.latitude, longitude: house.location.longitude))
////            mapKit.addAnnotation(Point)
////        }
//    }
//
//}
