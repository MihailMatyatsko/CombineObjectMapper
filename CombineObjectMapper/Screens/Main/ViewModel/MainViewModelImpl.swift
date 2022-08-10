//
//  MainViewModelImpl.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Combine
import Foundation

final class MainViewModelImpl: BaseViewModel, IMainViewModel {
    
    var dataSourcePublisher: Published<[UserCellViewModel]>.Publisher {
        return $dataSource
    }
    
    internal var users: [User] = []
    @Published var dataSource: [UserCellViewModel] = []
    
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
                self?.generateViewModels(users: self?.users)
            }
            .store(in: &cancellable)
    }
    
    private func generateViewModels(users: [User]?) {
        guard let users = users else { return }
        dataSource = users.map({ user -> UserCellViewModel in
            return UserCellViewModelImpl(
                userName: user.name ?? "",
                nick: user.username ?? "",
                email: user.email ?? "",
                userAdress: user.adress
            )
        })
    }
    
}
