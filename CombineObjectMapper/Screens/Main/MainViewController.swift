//
//  MainViewController.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    var viewModel: IMainViewModel!
    private var cancellable: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        setupObservers()
        view.backgroundColor = .magenta
    }
    
    //MARK: - Private
    private func setupObservers() {
        viewModel.usersPublisher
            .receive(on: DispatchQueue.main)
            .sink { users in
                print("Users amount: \(users.count)")
            }
            .store(in: &cancellable)
    }

}

