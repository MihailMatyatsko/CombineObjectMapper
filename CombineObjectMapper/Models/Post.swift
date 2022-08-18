//
//  Post.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 18.08.2022.
//

import Foundation

struct Post: Codable, Equatable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
