//
//  MyRestaurant.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import ObjectMapper

class myTestRestaurent: Mappable {
    var restaurantname: String?
    var allRestaurants: [Restaurant]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        restaurantname    <- map["name"]
        allRestaurants     <- map["children"]
    }
}
