//
//  Page.swift
//  MovieOn
//
//  Created by María Pérez  on 30/12/24.
//

import Foundation

struct Page: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let tag: Int
}

extension Page {
    static let pages: [Page] = [Page(name: "Page 1", description: "description 1", tag: 0),
                                Page(name: "Page 2", description: "description 2", tag: 1),
                                Page(name: "Page 3", description: "description 3", tag: 2)]
}
