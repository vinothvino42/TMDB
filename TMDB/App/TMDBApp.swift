//
//  TMDBApp.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

@main
struct TMDBApp: App {
    @State private var errorState: ErrorState?
    @State private var showAlert = false
    
    var body: some Scene {
        WindowGroup {
            RootView()
            // TODO: To show error globally
//                .onPreferenceChange(ErrorStateKey.self) { value in
//                    errorState = value
//                    showAlert = value != nil
//                }
//                .errorAlert(isPresenting: $showAlert, error: errorState?.error)
        }
    }
}
