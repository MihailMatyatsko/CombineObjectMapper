//
//  IMainViewModel.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation

protocol IMainViewModel {
    var dataSourcePublisher: Published<[UserCellViewModel]>.Publisher { get }
    var users: [User] { get }
    var dataSource: [UserCellViewModel] { get }
    
    func viewDidLoad()
}
