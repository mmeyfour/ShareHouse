//
//  UIImage.swift
//  ShareHouse
//
//  Created by Mersad Meyfour Asadi on 14/10/2020.
//

import Foundation
import UIKit

extension UIImage{
//    static func mainImage(houseId: String?) -> UIImage {
//        guard let houseId = houseId else {
//            return UIImage(named: "")!
//        }
//        guard let mainImageUrl = Bundle.main.url(forResource: houseId, withExtension: "png", subdirectory: "Images"),
//              let imageData = try? Data(contentsOf: mainImageUrl),
//              let image = UIImage(named: "0")
//        else {
//            return UIImage(named: "0")!
//        }
//        return image
//    Esto es temporal
    static func mainImage(houseId: String?) -> UIImage {
        
        return UIImage(named: "house")!
    }
}
