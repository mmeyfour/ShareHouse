//
//  HomeAPI.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 16/10/2020.
//

import Foundation

struct HomeAPI {
    static var baseURL = URL(string: "https://backend01-c7196.firebaseio.com/")
    static var homeURL = HomeAPI.baseURL?.appendingPathComponent("rental_list")
}

