//
//  MovieListVM.swift
//  MovieOn
//
//  Created by Alam Alonzo on 23/12/24.
//

import Foundation


@Observable
final class MovieListVM {
    let repository: MovieRepositoryProtocol
    
    var response: MovieResponse?
    var movies: [Movie] = []
    var page = 1
    
    init(repository: MovieRepositoryProtocol = MovieRepository()) {
        self.repository = repository
    }
    
    private func isLast(id: UUID) -> Bool {
        movies.last?.id == id
    }
}

@MainActor
extension MovieListVM {
    func loadMovies() async {
        do {
            let movieResponse = try await repository.getMovie(page: "\(page)")
            response = movieResponse
            movies += movieResponse.results
        } catch {
            print(error)
        }
    }
    
    func loadNextPage(id: UUID) {
        guard let response = response,
              page <= response.totalPages else { return }
        if isLast(id: id) {
            page += 1
            Task {
                await loadMovies()
            }
        }
    }
    
    func searchMovieByID(id: Int) -> Movie? {
        return nil
    }
}
