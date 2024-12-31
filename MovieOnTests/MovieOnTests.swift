//
//  MovieOnTests.swift
//  MovieOnTests
//
//  Created by María Pérez  on 17/12/24.
//

import Testing
import Foundation
@testable import MovieOn

extension Tag {
    @Tag static var repository: Self
    @Tag static var vm: Self
}

@Suite("My tests", .tags(.repository)) @MainActor
struct MovieOnTests {
    let repository: MovieRepositoryProtocol
    let vm: MovieListVM
    
    init() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [NetworkTest.self]
        let session = URLSession(configuration: config)
        repository = MovieRepository(session: session)
        vm = MovieListVM(repository: repository)
        
    }

    @Test("Comprobar que el repository nos devuelva la pagina 1")
    func getMoviesFromRepository() async throws {
        let movies = try await repository.getMovie(page: "1")
        #expect(movies.results.count == 20)
        #expect(movies.page == 1)
    }
    
    @Test("Comprobar el loadMovies del VM")
    func loadMoviesFromVM() async throws {
        try #require(await vm.loadMovies())
        #expect(vm.response != nil)
        #expect(vm.response?.page == 1)
        #expect(vm.movies.count == 20)
    }
    
    @Test("Comprobar que se carga la página 2")
    func loadPage2() async throws {
        try #require(await vm.loadMovies())
        #expect(vm.response?.page == 1)
        #expect(vm.movies.count == 20)
        vm.page += 1
        try #require(await vm.loadMovies())
        #expect(vm.movies.count == 40)
    }
    
    @Test("Comprobar que loadNextPage carga la página 2")
    func loadNextPage() async throws {
        try #require(await vm.loadMovies())
        #expect(vm.movies.count == 20)
        let lastItem = try #require(vm.movies.last?.id)
        vm.loadNextPage(id: lastItem)
        try await Task.sleep(for: .seconds(1))
        #expect(vm.movies.count == 40)
    }
    
    @Test("Prueba", arguments: [
        (1, "Interestelar"),
        (2, "La vaca")
    ])
    func pruebaTest(id: Int, movieNames: String) async throws {
        vm.searchMovieByID(id: id)
    }
}
