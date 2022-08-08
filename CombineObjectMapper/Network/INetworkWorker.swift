//
//  INetworkWorker.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import Combine

protocol INetworkWorker {
    func getUsersData() -> Future<[User], NetworkErrors>
}
