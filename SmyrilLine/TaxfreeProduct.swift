//
//  TaxfreeProduct.swift
//  SmyrilLine
//
//  Created by Rafay Hasan on 7/7/17.
//  Copyright © 2017 Rafay Hasan. All rights reserved.
//

import Foundation
import Foundation
import ObjectMapper

class taxFreeProduct: Mappable {
    var productName: String?
    var productImageUrlStr: String?
    var productDetails: String?
    var productDescription: String?
    var productPrice: String?
    
    
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        productName    <- map["name"]
        productImageUrlStr     <- map["imageUrl"]
        productDetails      <- map["description"]
        productDescription      <- map["header"]
        productPrice <- map["price"]
    }
}
