//
//  SplaceView.swift
//  CodingChallenge
//
//  Created by Dharmdeep Poojara on 28/01/25.
//

import SwiftUI

struct SplaceView: View {
    @EnvironmentObject var appRootManager : AppRootManager
    var body: some View {
        Text("CountryList Demo")
            .font(.title)
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    appRootManager.currentRoot = .cityView
                }
            })
    }
}

#Preview {
    SplaceView()
}
