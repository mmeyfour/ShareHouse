//
//  HouseListViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import UIKit
import MapKit

class HouseListViewController: UIViewController {
    lazy var networkController = NetworkController(session: URLSession(configuration: .default), houseListDelegate: self)
    var houseListDataSource: HouseListDataSource?
    var selectedHouseID: String?
    
    @IBOutlet weak var mapKit: MKMapView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(1)
        setupView()
        setupTableView()
        setupMapKit()
        networkController.fetchHouseList()
        
    }

    
    func setupView() {
        print(2)
        mapKit.isHidden = true
        segmentController.setTitle("Lista", forSegmentAt: 0)
        segmentController.setTitle("Mapa", forSegmentAt: 1)
    }
    
    func  setupTableView() {
        print(3)
        // 1. Register cell types
        let identifier = HouseTableViewCell.identifier
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
        
        // 2. Connect delegate
        tableView.delegate = self
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
    
    func setupMapKit() {
        // Initial Point
        let initialLocation = CLLocation(latitude: 36.718858, longitude: -4.4239175)
        mapKit.centerToLocation(initialLocation)
        
        // Map View
        let pointCenter = CLLocation(latitude: 36.718858, longitude: -4.4239175)
        let region = MKCoordinateRegion(
            center: pointCenter.coordinate,
            latitudinalMeters: 5000,
            longitudinalMeters: 6000)
        mapKit.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapKit.setCameraZoomRange(zoomRange, animated: true)
        
        // istan point
        let istanPoint = MapPoint(
            title: "Pakistan",
            locationName: "los jarales",
            discipline: "Hotel",
            coordinate: CLLocationCoordinate2D(latitude: 36.5783, longitude: -4.9499))
        mapKit.addAnnotation(istanPoint)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HouseDetailViewController {
            let vc = segue.destination as? HouseDetailViewController
            vc?.selectedHouse = selectedHouseID
            
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

extension HouseListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("el ID de lacasa seleccionada es : \(houseListDataSource!.houses[indexPath.row].id)")
        selectedHouseID = houseListDataSource!.houses[indexPath.row].id
        performSegue(withIdentifier: HouseDetailViewController.segueIdentifier, sender: nil)
    }
}

extension HouseListViewController: HouseListDelegate {
    
    func didFetch(houses: [HouseSummaryViewModel]) {
        
        houseListDataSource = HouseListDataSource(houses: houses)
        tableView.dataSource = houseListDataSource
        tableView.reloadData()
        
        for house in houseListDataSource!.houses {
            print(house.name)
            print(house.dateAdded)
            print(house.description)
            print(house.floorArea)
            print(house.image)
            print(house.location)
            print(house.monthlyPrice)
            print(house.realtor)
            print(house.rooms)
            print(house.isRented)
            print("-----------------------------------")
            let Point = MapPoint(
                title: "\(house.realtor)",
                locationName: "\(house.name)",
                discipline: "House",
                coordinate: CLLocationCoordinate2D(latitude: house.location.latitude, longitude: house.location.longitude))
            mapKit.addAnnotation(Point)
        }
    }

}



