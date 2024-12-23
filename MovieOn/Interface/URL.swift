//
//  URL.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import Foundation

let mainURL = URL(string: "https://api.themoviedb.org/3/movie")!

extension URL {
    //ENDPOINT NowPlaying
    static func nowPlaying(page: String) -> URL {
            mainURL
            .appending(path: "now_playing")
            .appending(queryItems: [.queryPage(page: page), .queryLang()])
        }
}

extension URLQueryItem {
    static func queryPage(page: String) -> URLQueryItem {
        URLQueryItem(name: "page", value: page)
    }
    
    static func queryLang() -> URLQueryItem {
        let lang = Locale.preferredLanguages.first ?? "es-ES"
        print(lang)
        return URLQueryItem(name: "language", value: lang)
    }
}
