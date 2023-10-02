//
//  RootView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct RootView: View {
    @StateObject private var session = SessionManager()
    @AppStorage(UserDefaultKeys.themeMode) private var themeMode: Int = ThemeMode.allCases.first!.rawValue
    
    private var selectedColorScheme: ColorScheme? {
        guard let themeMode = ThemeMode(rawValue: themeMode) else { return nil }
        
        switch themeMode {
        case .lightMode:
            return .light
        case .darkMode:
            return .dark
        default:
            return nil
        }
    }
    
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
        .preferredColorScheme(selectedColorScheme)
        .animation(.easeInOut, value: session.currentState)
        .onAppear(perform: session.configureInitialState)
    }
}

#Preview {
    RootView()
}
