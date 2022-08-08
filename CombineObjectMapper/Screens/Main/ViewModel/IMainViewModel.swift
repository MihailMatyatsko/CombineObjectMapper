//
//  IMainViewModel.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation

protocol IMainViewModel {
    var usersPublisher: Published<[User]>.Publisher { get }
    var users: [User] { get }
    
    func viewDidLoad()
}
