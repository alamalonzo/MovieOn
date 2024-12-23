//
//  ContentView.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = MovieListVM()
    var body: some View {
        List(vm.movies) { movie in
            Text(movie.title)
                .onAppear {
                    vm.loadNextPage(id: movie.id)
                }
        }
        .listStyle(.plain)
        .padding()
        .task {
            await vm.loadMovies()
        }
        
    }
}

#Preview {
    ContentView(vm: .preview)
}
