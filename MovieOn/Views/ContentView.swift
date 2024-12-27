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
        NavigationStack {
            List(vm.movies) { movie in
                HStack {
                    Text("Title: \(movie.title)")
                    Spacer()
                    Text("Rate: \(movie.rate)")
                }
                    .onAppear {
                        vm.loadNextPage(id: movie.id)
                    }
            }
            .navigationTitle("Now Playing")
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
