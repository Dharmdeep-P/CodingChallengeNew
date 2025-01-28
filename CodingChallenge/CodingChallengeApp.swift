//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import SwiftUI

@main
struct CodingChallengeApp: App {
    @StateObject private var appRootManager = AppRootManager()
    
    var body: some Scene {
        WindowGroup {
            switch appRootManager.currentRoot {
            case .splashView:
                SplaceView()
            case .cityView:
                CityView()
            }
        }
        .environmentObject(appRootManager)
    }
}
