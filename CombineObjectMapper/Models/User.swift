//
//  BaseModel.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import ObjectMapper

final class User: Mappable {
    
    var identity: Int?
    var name: String?
    var username: String?
    var email: String?
    var adress: Adress!
    
    init?(map: Map) { }
    
    func mapping(map: Map) {
        identity     <- map["id"]
        name         <- map["name"]
        username     <- map["username"]
        email        <- map["email"]
        adress       <- map["address"]
    }
    
}
