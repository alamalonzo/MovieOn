//
//  PreviewData.swift
//  MovieOn
//
//  Created by Alam Alonzo on 23/12/24.
//

import Foundation


struct MovieRepositoryPreview: MovieRepositoryProtocol {
    func getMovie(page: String) async throws(NetworkError) -> MovieResponse {
        let url = Bundle.main.url(forResource: "previewData", withExtension: "json")!
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(MovieResponseDTO.self, from: data).mapToModel
        } catch {
            throw .general(error)
        }
        
    }
}

@MainActor
extension MovieListVM {
    static let preview = MovieListVM(repository: MovieRepositoryPreview())
}

//extension JSONDecoder {
//    func customDecoder(_ type: Decodable.Type, from: Data) throws -> Decodable {
//        dateDecodingStrategy = .iso8601
//        return try self.decode(type, from: from)
//    }
//}

extension Movie {
    static let moviePreview = Movie(id: UUID(), adult: false,
                                    backdropPath: "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
                                    movieID: 845781,
                                    originalLanguage: "en",
                                    originalTitle: "Red One",
                                    overview: "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
                                    popularity: 6943.482,
                                    posterPath: "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
                                    releaseDate: "2024-10-31",
                                    title: "Maria on fire",
                                    video: false,
                                    voteAverage: 7.0)
}
