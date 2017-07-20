//
//  DestinationObject.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/8/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import ObjectMapper

class smyrilLineDestination: Mappable {
    var destinationName: String?
    var allDestinations: [destination]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        destinationName    <- map["name"]
        allDestinations     <- map["children"]
    }
}

class destination: Mappable {
    var destinationId: String?
    var destinationImageUrlStr: String?
    var destinationname: String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        destinationId    <- map["id"]
        destinationImageUrlStr     <- map["imageUrl"]
        destinationname      <- map["name"]
    }
}

class DestinationType: Mappable {
    var destinationName: String?
    var destinationImageUrlStr: String?
    var destinationDetails: String?
    var allDestinationProgramme: [destinationTypeCategory]?
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        destinationName    <- map["name"]
        destinationImageUrlStr    <- map["imageUrl"]
        destinationDetails    <- map["header"]
        allDestinationProgramme     <- map["children"]
    }
}

class destinationTypeCategory: Mappable {
    var programmeId: String?
    var programmeImageUrlStr: String?
    var programmeName: String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        programmeId    <- map["id"]
        programmeImageUrlStr     <- map["imageUrl"]
        programmeName      <- map["name"]
    }
}








