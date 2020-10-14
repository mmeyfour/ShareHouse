//
//  ViewController.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    loadSampleRentalDetail()
    loadMalagaRentalList()
    // Do any additional setup after loading the view.
  }
  func loadSampleRentalDetail() {
    guard let url = Bundle.main.url(forResource: "RentalDetail", withExtension: "json"),
      let data = try? Data(contentsOf: url) else {
        return
    }
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
    guard let rentalDetail = try? decoder.decode(RentalDetail.self, from: data) else {
      return
    }
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "dd MMMM yyyy"
    print("El propietario \(rentalDetail.realtor) a fecha de \(dateFormatterPrint.string(from: rentalDetail.dateAdded)) alquila el apartamento en \(rentalDetail.name) con \(rentalDetail.floorArea) m^2 al precio de \(rentalDetail.monthlyPrice) €/mes")
  }
  func loadMalagaRentalList() {
    guard let url = Bundle.main.url(forResource: "MalagaRentalList", withExtension: "json"),
       let data = try? Data(contentsOf: url) else {
      return
    }
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = "yyyy-MM-dd"
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .formatted(dateFormatterGet)
    let malagaRentalList = try! decoder.decode([String:RentalDetail].self, from: data)
    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = "dd MMMM yyyy"
    for (key,value) in malagaRentalList {
      print("Esta es la calle \(key) con \(value)")
    }
  }
}
