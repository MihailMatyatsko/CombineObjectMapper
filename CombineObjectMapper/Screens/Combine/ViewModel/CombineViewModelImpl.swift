//
//  CombineViewModelImpl.swift
//  CombineObjectMapper
//
//  Created by Matyatsko Mihail on 18.08.2022.
//

import Foundation
import Combine

final class CombineViewModelImpl: BaseViewModel, ICombineViewModel {
    
    var dataSourcePublisher: Published<[PostTableViewModel]>.Publisher {
        return $dataSource
    }
    @Published var dataSource: [PostTableViewModel] = []
    
    //MARK: - Public
    func viewWillAppear() {
        fetch()
    }
    
    //MARK: - Private
    private func fetch() {
        networkWorker.getPost { [weak self] posts in
            self?.generateViewModels(posts)
        }
    }
    
    private func generateViewModels(_ posts: [Post]) {
        dataSource = posts.map { post -> PostTableViewModel in
            return PostTableViewModelImpl(
                post.id,
                title: post.title,
                body: post.body
            )
        }
    }
    
}