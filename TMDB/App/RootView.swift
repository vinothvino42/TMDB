//
//  RootView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

enum ThemeMode: Int, CaseIterable {
    case system
    case lightMode
    case darkMode
}

struct RootView: View {
    @State private var isLoggedIn = false
    @AppStorage("themeMode") private var themeMode: Int = ThemeMode.allCases.first!.rawValue
    @Environment(\.colorScheme) private var colorScheme
    
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
            if (isLoggedIn) {
                NavigationStack {
                    TabView {
                        HomeView()
                            .tabItem {
                                Label("Home", systemImage: "house")
                            }
                        
                        SearchView()
                            .tabItem {
                                Label("Search", systemImage: "magnifyingglass")
                            }
                        
                        SettingsView()
                            .tabItem {
                                Label("Settings", systemImage: "gearshape")
                            }
                    }
                }
            } else {
                LoginView()
            }
        }
        .preferredColorScheme(selectedColorScheme)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
