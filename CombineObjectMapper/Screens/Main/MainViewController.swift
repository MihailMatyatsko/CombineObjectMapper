//
//  MainViewController.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.contentInsetAdjustmentBehavior = .never
        return tableView
    }()
    
    var viewModel: IMainViewModel!
    private var reuseIdentifier: String = "cell"
    private var cancellable: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addTableViewOnScreen()
        configureTableView()
        viewModel.viewDidLoad()
        setupObservers()
    }
    
    //MARK: - Private
    private func setupUI() {
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            UINib(nibName: String(describing: UserTableViewCell.self), bundle: nil),
            forCellReuseIdentifier: reuseIdentifier
        )
    }
    
    private func setupObservers() {
        viewModel.dataSourcePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] users in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    private func addTableViewOnScreen() {
        tableView.frame = view.bounds
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
}

extension MainViewController: UITableViewDelegate { }

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(with: viewModel.dataSource[indexPath.row])
        
        return cell
    }
    
}

