//
//  RootView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct RootView: View {
    @StateObject private var session = SessionManager()
    
    var body: some View {
        ZStack {
            switch session.currentState {
            case .loggedIn:
                HomeTabView()
                    .environmentObject(session)
                    .transition(.opacity)
            case .loggedOut:
                LoginView()
                    .environmentObject(session)
                    .transition(.opacity)
            default:
                OnboardView()
                    .environmentObject(session)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .leading)))
            }
        }
        .animation(.easeInOut, value: session.currentState)
        .onAppear(perform: session.configureInitialState)
    }
}

#Preview {
    RootView()
}
