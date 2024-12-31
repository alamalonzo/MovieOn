//
//  NavigationManager.swift
//  MovieOn
//
//  Created by María Pérez  on 30/12/24.
//

import Foundation
import SwiftUI

@Observable
final class NavigationManager {
    enum Destinations: Hashable {
        case vista1
        case vista2
        case detailView(Movie)
    }
    
    var destinationPath = NavigationPath()
    
    func navigate(to destination: Destinations) {
        destinationPath.append(destination)
    }
    
    func backToRoot() {
        destinationPath.removeLast(destinationPath.count)
    }
}
