//
//  ShipInfoObject.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import ObjectMapper

class shipInfo: Mappable {
    var name: String?
    var imageUrlStr: String?
    var shipDetails: String?
    var infoCategory: [InfoObject]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        imageUrlStr    <- map["imageUrl"]
        shipDetails    <- map["header"]
        infoCategory     <- map["children"]
    }
}

class InfoObject: Mappable {
    var infoId: String?
    var infoImageUrlStr: String?
    var infoname: String?
    var infoDetails: String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        infoId    <- map["id"]
        infoImageUrlStr     <- map["imageUrl"]
        infoname      <- map["subheader"]
        infoDetails      <- map["header"]
    }
}

class shipInfoDetails: Mappable {
    var name: String?
    var imageUrlStr: String?
    var shipDetails: String?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        imageUrlStr    <- map["imageUrl"]
        shipDetails    <- map["header"]
    }
}
