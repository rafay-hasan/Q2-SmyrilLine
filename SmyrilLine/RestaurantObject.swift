//
//  RestaurantObject.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import ObjectMapper

class Restaurant: Mappable {
    var restaurantId: String?
    var restaurantImageUrlStr: String?
    var restaurantname: String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        restaurantId    <- map["id"]
        restaurantImageUrlStr     <- map["imageUrl"]
        restaurantname      <- map["name"]
    }
}
