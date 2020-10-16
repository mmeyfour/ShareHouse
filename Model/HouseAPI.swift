//
//  HomeAPI.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import Foundation

struct HouseAPI {
    static var baseURL = URL(string: "https://backend01-c7196.firebaseio.com/")!
    static var houseURL = HouseAPI.baseURL.appendingPathComponent("rental_list")
}

