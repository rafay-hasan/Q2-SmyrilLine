//
//  TaxFreeObjects.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/7/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import ObjectMapper

class taxFreeShop: Mappable {
    var name: String?
    var imageUrlStr: String?
    var details: String?
    var product: [taxFreeProduct]?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        imageUrlStr     <- map["imageUrl"]
        details      <- map["header"]
        product <- map["children"]
    }
}
