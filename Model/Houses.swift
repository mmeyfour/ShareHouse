//
//  Houses.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import Foundation
import UIKit

struct HouseDetail: Codable {
  let realtor : String
  let monthlyPrice :Int
  let name : String
  let rooms : Int
  let floorArea: Int
  let description: String
  let dateAdded: Date
}

struct HouseList: Codable {
  var dictionaryRentalList : [String : HouseDetail] = [:]
}

struct HouseSummaryViewModel {
    let image: UIImage
    let name: String
    let realtor : String
    let monthlyPrice :Int
    let rooms : Int
    let floorArea: Int
    let description: String
    let dateAdded: Date
}
