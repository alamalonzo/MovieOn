//
//  MovieResponseDTO.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import Foundation

struct MovieResponseDTO: Codable {
    let page: Int
    let results: [MovieDTO]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    var mapToModel: MovieResponse {
        MovieResponse(
            page: page,
            results: results.map { $0.mapToModel },
            totalPages: totalPages,
            totalResults: totalResults
        )
    }
}

struct MovieDTO: Codable {
    let adult: Bool
    let backdropPath: String?
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
    }
    
    var mapToModel: Movie {
        Movie(
            adult: adult,
            backdropPath: backdropPath,
            movieID: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            video: video,
            voteAverage: voteAverage
        )
    }
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//    case fr = "fr"
//    case hi = "hi"
//}
