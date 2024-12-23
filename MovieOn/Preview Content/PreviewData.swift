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
