//
//  APIConfig.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import Foundation

struct APIConfig {
    static let shared = APIConfig()
    var token: String?
    
    private init() {
       try? recoverAppToken()
    }
    
    private mutating func recoverAppToken() throws {
        guard let url = Bundle.main.url(forResource: "APIConfig", withExtension: ".plist") else {
            return
        }
        let data = try Data(contentsOf: url)
        let plist = try PropertyListDecoder().decode([String:String].self, from: data)
        token = plist["AppToken"]
        
    }
}
