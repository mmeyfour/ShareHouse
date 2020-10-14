//
//  Houses.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 13/10/2020.
//

import Foundation

struct RentalDetail: Codable {
  let realtor : String
  let monthlyPrice :Int
  let name : String
  let rooms : Int
  let floorArea: Int
  let description: String
  let dateAdded: Date
}
struct MalagaList: Codable {
  var dictionaryRentalList : [String:RentalDetail] = [:]
}
