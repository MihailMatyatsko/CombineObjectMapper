//
//  ICombineViewModel.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 18.08.2022.
//

import Foundation
import Combine

protocol ICombineViewModel {
    var dataSourcePublisher: Published<[PostTableViewModel]>.Publisher { get }
    var dataSource: [PostTableViewModel] { get }
    
    func viewWillAppear()
    func fetchAlbums()
}
