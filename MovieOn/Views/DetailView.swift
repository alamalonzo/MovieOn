//
//  DetailView.swift
//  MovieOn
//
//  Created by María Pérez  on 30/12/24.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    @Environment(NavigationManager.self) var navManager
    
    var body: some View {
        Button {
            navManager.navigate(to: .vista2)
        } label: {
            Text(movie.title)
        }
    }
}

struct ViewAlamOnFire: View {
    @Environment(NavigationManager.self) var navManager
    
    var body: some View {
        Button {
            navManager.backToRoot()
        } label: {
            Text("Back to root")
        }
    }
}

#Preview {
    DetailView(movie: .moviePreview)
        .environment(NavigationManager())
}
