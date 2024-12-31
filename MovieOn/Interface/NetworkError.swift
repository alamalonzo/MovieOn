//
//  NetworkError.swift
//  MovieOn
//
//  Created by Silvia Caraballo Fernandez on 19/12/24.
//

import Foundation
enum NetworkError: LocalizedError {
    case nonHttp
    case general(Error)
    case badStatusCode(Int)
    case errorDecode(Error)
    var errorDescription: String? {
        switch self {
        case .nonHttp:
            "Non HTTp request"
        case .general(let myError):
            "General Error \(myError)"
        case .badStatusCode (let statusCode):
            "Wrong Status code\(statusCode)"
        case .errorDecode (let decodeError):
            "error Decode\(decodeError)"
        }
    }
    
}
