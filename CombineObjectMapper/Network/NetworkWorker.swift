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
    
    private let apiURL = URL(string: "https://jsonplaceholder.typicode.com/users")!
    
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
