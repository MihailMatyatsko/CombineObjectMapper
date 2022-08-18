//
//  PostTableViewModel.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 18.08.2022.
//

import Foundation

protocol PostTableViewModel {
    var title: String { get }
    var body: String { get }
}

final class PostTableViewModelImpl: PostTableViewModel {
    
    var id: Int
    var title: String
    var body: String
    
    init(
        _ id: Int,
        title: String,
        body: String
    ) {
        self.id = id
        self.body = body
        self.title = title
    }
    
}
