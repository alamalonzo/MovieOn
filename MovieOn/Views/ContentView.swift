//
//  ContentView.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var vm = MovieListVM()
    @Environment(NavigationManager.self) var navManager
    
    var body: some View {
        @Bindable var bnavManager = navManager
        NavigationStack(path: $bnavManager.destinationPath) {
            List(vm.movies) { movie in
                Button {
                    navManager.navigate(to: .detailView(movie))
                } label: {
                    Text("Title: \(movie.title)")
                    Spacer()
                    Text("Rate: \(movie.rate)")
                }
                .onAppear {
                    vm.loadNextPage(id: movie.id)
                }
            }
            .navigationTitle("Now Playing")
            .navigationDestination(for: NavigationManager.Destinations.self) { destinations in
                switch destinations {
                case .vista1:
                    Text("Vista 1")
                case .vista2:
                    ViewAlamOnFire()
                case .detailView(let movie):
                    DetailView(movie: movie)
                }
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
        .environment(NavigationManager())
}
