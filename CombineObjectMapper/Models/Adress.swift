//
//  Adress.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import ObjectMapper

final class Adress: ImmutableMappable {
    
    let street: String
    let suite: String
    let apsentField: Int?
    
    init(map: Map) throws {
        street          = try map.value("street")
        suite           = try map.value("suite")
        apsentField     = try? map.value("field")
    }
    
}
