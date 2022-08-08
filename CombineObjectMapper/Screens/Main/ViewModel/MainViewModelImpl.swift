//
//  MainViewModelImpl.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation

final class MainViewModelImpl: IMainViewModel {
    
    var networkWorker: NetworkWorker
    
    init() {
        networkWorker = NetworkWorker()
    }
    
}
