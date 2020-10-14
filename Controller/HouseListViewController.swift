//
//  HouseListViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit
import MapKit

class HouseListViewController: UIViewController {
    
    let houseListDataSource = HouseListDataSource()
    
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        mapKit.isHidden = true
        segmentController.setTitle("Lista", forSegmentAt: 0)
        segmentController.setTitle("Mapa", forSegmentAt: 1)
        // Istan
        let initialLocation = CLLocation(latitude: 36.5783, longitude: -4.9499)
        mapKit.centerToLocation(initialLocation)
        
        // Limitar la cam
        let istanCenter = CLLocation(latitude: 36.5783, longitude: -4.9499)
            let region = MKCoordinateRegion(
              center: istanCenter.coordinate,
              latitudinalMeters: 50000,
              longitudinalMeters: 60000)
            mapKit.setCameraBoundary(
              MKMapView.CameraBoundary(coordinateRegion: region),
              animated: true)
            
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
            mapKit.setCameraZoomRange(zoomRange, animated: true)
        let artwork = MapPoint(
          title: "Pakistan",
          locationName: "los jarales",
          discipline: "Hotel",
          coordinate: CLLocationCoordinate2D(latitude: 36.5783, longitude: -4.9499))
        mapKit.addAnnotation(artwork)
        
        print("---------------------------------------------")
        print(houseListDataSource.houses)
        print("---------------------------------------------")
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
            mapKit.isHidden = true
        }else if segmentController.selectedSegmentIndex == 1 {
            tableView.isHidden = true
            mapKit.isHidden = false
        }else{
            tableView.isHidden = true
            mapKit.isHidden = false
        }
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
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

