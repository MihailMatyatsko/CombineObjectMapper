//
//  UserCellViewModel.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 09.08.2022.
//

import Foundation

protocol UserCellViewModel {
    var userName: String { get }
    var nickName: String { get }
    var email: String { get }
    var userAdress: Adress { get }
}

final class UserCellViewModelImpl: UserCellViewModel {
    
    var userName: String
    var nickName: String
    var email: String
    var userAdress: Adress
    
    init(
        userName: String,
        nick: String,
        email: String,
        userAdress: Adress
    ) {
        self.userName = userName
        self.nickName = nick
        self.email = email
        self.userAdress = userAdress
    }
    
}
