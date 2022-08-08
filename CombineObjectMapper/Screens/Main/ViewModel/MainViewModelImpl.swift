//
//  MainViewModelImpl.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Combine
import Foundation

final class MainViewModelImpl: BaseViewModel, IMainViewModel {
    
    var usersPublisher: Published<[User]>.Publisher {
        return $users
    }
    
    @Published var users: [User] = []
    
    override init() {
        super.init()
    }
    
    //MARK: - Public
    func viewDidLoad() {
        performUserDataFetch()
    }
    
    //MARK: - Private
    private func performUserDataFetch() {
        networkWorker.getUsersData()
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.rawValue)")
                }
            } receiveValue: { [weak self] resultValue in
                self?.users = resultValue
            }
            .store(in: &cancellable)
    }
    
}
