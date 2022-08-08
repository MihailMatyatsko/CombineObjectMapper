//
//  BaseViewModel.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import Combine

class BaseViewModel {
    
    internal var networkWorker: INetworkWorker
    var cancellable: Set<AnyCancellable> = []
    
    init() {
        networkWorker = NetworkWorker()
    }
    
}
