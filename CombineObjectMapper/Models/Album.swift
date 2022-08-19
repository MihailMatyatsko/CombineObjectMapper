//
//  Album.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 19.08.2022.
//

import Foundation

struct Album: Decodable, Equatable {
    
    let userId: Int
    let id: Int
    let title: String
    let author: String?
    
    init(
        userId: Int,
        id: Int,
        title: String,
        author: String?
    ) {
        self.userId = userId
        self.id = id
        self.title = title
        self.author = author
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(Int.self, forKey: .id)
        self.userId = try values.decode(Int.self, forKey: .userId)
        self.title = try values.decode(String.self, forKey: .title)
        self.author = try? values.decodeIfPresent(String.self, forKey: .author)
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id = "id"
        case title
        case author = "author"
    }
    
}
