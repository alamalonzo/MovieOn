//
//  NetworkRepository.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import Foundation

protocol NetworkRepositoryProtocol {
    var session: URLSession { get }
}

extension NetworkRepositoryProtocol {
    func getJSON<MODEL>(urlReq: URLRequest, model: MODEL.Type) async throws (NetworkError) -> MODEL where MODEL:Codable {
        let (data, response) = try await session.customData(urlReq: urlReq)
        if response.statusCode == 200 {
           do {
               return try JSONDecoder().decode(model, from: data)
           } catch let error {
               throw NetworkError.errorDecode(error)
           }
        } else {
            throw NetworkError.badStatusCode(response.statusCode)
        }
    }
}


