//
//  AppRootManager.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import Foundation

final class AppRootManager: ObservableObject {
    @Published var currentRoot: Roots = .splashView
    
    enum Roots: Int {
        case splashView = 0
        case cityView
    }
}
