//
//  PageView.swift
//  MovieOn
//
//  Created by María Pérez  on 30/12/24.
//

import SwiftUI

struct PageView: View {
    let page: Page
    
    var body: some View {
        VStack {
            Text(page.name)
            Text(page.description)
            MovieRankView(movie: .moviePreview)
        }
    }
}

#Preview {
    PageView(page: .pages.first!)
}
