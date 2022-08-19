//
//  NetworkWorker.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation
import Combine
import ObjectMapper

final class NetworkWorker: INetworkWorker {
    
    private let jsonDecoder = JSONDecoder()
    private let apiURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    private let postsAPI = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private let albumsAPI = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    
    private var cancellable: Set<AnyCancellable> = []
    
    func getPost(completion: @escaping ([Post]) -> () ) {
        URLSession.shared.dataTaskPublisher(for: postsAPI)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 && response.statusCode < 300
                else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Post].self, decoder: jsonDecoder)
            .eraseToAnyPublisher()
            .sink { result in
                switch result {
                case .finished:
                    print("Successfully parsed data with data task publisher")
                case .failure(let error):
                    print("Error while parsing data via data task publisher: \(error.localizedDescription)")
                    
                }
            } receiveValue: { posts in
                completion(posts)
            }
            .store(in: &cancellable)
    }
    
    func getUsersData() -> Future<[User], NetworkErrors> {
        return Future { [weak self] promise in
            guard let self = self else { return }
            self.fetchUserData { result in
                switch result {
                case .success(let data):
                    guard let jsonString = String(data: data, encoding: .ascii) else {
                        promise(.failure(.invalidData))
                        return
                    }
                    let users = [User].init(JSONString: jsonString) ?? []
                    promise(.success(users))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
    
    func fetchAlbums(completion: @escaping (Result<[Album], NetworkErrors>) -> () ) {
        URLSession.shared.dataTask(with: self.albumsAPI) { data, response, error in
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
                completion(.failure(.unknownError))
            }
            if
                let response = response as? HTTPURLResponse,
                let data = data
            {
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    let albums = try! self.jsonDecoder.decode([Album].self, from: data)
                    completion(.success(albums))
                } else {
                    completion(.failure(.serverIsUnreachable))
                }
            }
        }.resume()
    }
    
    private func fetchUserData(completion: @escaping (Result<Data, NetworkErrors>) -> () ) {
        URLSession.shared.dataTask(with: self.apiURL) { data, response, error in
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
                completion(.failure(.unknownError))
            }
            if
                let response = response as? HTTPURLResponse,
                let data = data
            {
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    completion(.success(data))
                } else {
                    completion(.failure(.serverIsUnreachable))
                }
            }
        }.resume()
    }
    
}
