//
//  NetworkErrors.swift
//  CombineObjectMapper
//
//  Created by Mihail Matyatsko on 08.08.2022.
//

import Foundation

enum NetworkErrors: String, Error {
    case serverIsUnreachable = "Can not connect to the server"
    case invalidData = "Could not parse recieved data"
    case unknownError = "Unknown error"
}
