//
//  MovieOnApp.swift
//  MovieOn
//
//  Created by María Pérez  on 17/12/24.
//

import SwiftUI

@main
struct MovieOnApp: App {
    @State var navManager = NavigationManager()
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingView()
            } else {
                ContentView()
                    .environment(navManager)
            }
        }
    }
}
