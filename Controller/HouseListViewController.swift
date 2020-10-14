//
//  HouseListViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit

class HouseListViewController: UIViewController {

    let houseListDataSource = HouseListDataSource()
    
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        segmentController.setTitle("Lista", forSegmentAt: 0)
        segmentController.setTitle("Mapa", forSegmentAt: 1)

    }
    
    func setupTableView() {
        
        let identifier = HouseTableViewCell.identifier
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        tableView.dataSource = houseListDataSource
    }
    @IBAction func didChangeTheSegment(_ sender: UISegmentedControl) {
        if segmentController.selectedSegmentIndex == 0 {
                tableView.isHidden = false
            }else if segmentController.selectedSegmentIndex == 1 {
                tableView.isHidden = true
            }else{
                tableView.isHidden = true
            }
    }
}


//class ViewController: UIViewController {
////    override func viewDidLoad() {
//        super.viewDidLoad()
////        loadSampleRentalDetail()
////        loadMalagaRentalList()
//        // Do any additional setup after loading the view.
//    }
//    func loadSampleRentalDetail() {
//        guard let url = Bundle.main.url(forResource: "HouseDetails", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            return
//        }
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd"
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
//        guard let rentalDetail = try? decoder.decode(HouseDetail.self, from: data) else {
//            return
//        }
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
////        print("El propietario \(rentalDetail.realtor) a fecha de \(dateFormatterPrint.string(from: rentalDetail.dateAdded)) alquila el apartamento en \(rentalDetail.name) con \(rentalDetail.floorArea) m^2 al precio de \(rentalDetail.monthlyPrice) €/mes")
//    }
//
//    func loadMalagaRentalList() {
//        guard let url = Bundle.main.url(forResource: "HouseList", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            return
//        }
//        let dateFormatterGet = DateFormatter()
//        dateFormatterGet.dateFormat = "yyyy-MM-dd"
//        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
//        let malagaRentalList = try! decoder.decode([String:HouseDetail].self, from: data)
//        let dateFormatterPrint = DateFormatter()
//        dateFormatterPrint.dateFormat = "dd MMMM yyyy"
//        for (key,value) in malagaRentalList {
////            print("Esta es la calle \(key) con \(value)")
//            print(key)
//            print(value)
//        }
//    }
//}

