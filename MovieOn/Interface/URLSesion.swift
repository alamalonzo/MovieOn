//
//  URLSesion.swift
//  MovieOn
//
//  Created by Silvia Caraballo Fernandez on 19/12/24.
//

import Foundation
extension URLSession {
    func customData(urlReq: URLRequest) async throws(NetworkError) -> (Data, HTTPURLResponse) {
        do {
            let (data, response) = try await data(for: urlReq)
            guard let respHTTPResp = response as? HTTPURLResponse else {
                throw NetworkError.nonHttp
            }
            return (data, respHTTPResp)
        } catch let error {
            throw NetworkError.general(error)
        }
    }
}
