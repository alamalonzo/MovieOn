//
//  MovieRepository.swift
//  MovieOn
//
//  Created by Silvia Caraballo Fernandez on 19/12/24.
//

import Foundation

protocol MovieRepositoryProtocol: Sendable {
    func getMovie(page: String) async throws(NetworkError) -> MovieResponse
}



struct MovieRepository: MovieRepositoryProtocol, NetworkRepositoryProtocol {
    let session: URLSession
    let apiConfig = APIConfig.shared
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func getMovie(page: String) async throws(NetworkError) -> MovieResponse {
        try await getJSON(urlReq: .getNowPlayingReq(url: .nowPlaying(page: page), token: apiConfig.token), model: MovieResponseDTO.self).mapToModel
    }
}


