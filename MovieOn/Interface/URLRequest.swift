//
//  URLRequest.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import Foundation

extension URLRequest {
    static func getNowPlayingReq(url: URL, token: String?) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        if let token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        urlRequest.setValue("accept", forHTTPHeaderField: "application/json")            
        return urlRequest
    }
}
