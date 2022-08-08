//
//  Adress.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import ObjectMapper

final class Adress: Mappable {
    
    var street: String?
    var suite: String?
    
    init?(map: Map) { }
    
    func mapping(map: Map) {
        street <- map["street"]
        suite  <- map["suite"]
    }
    
}
