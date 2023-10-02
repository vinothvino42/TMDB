//
//  HomeTabView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

enum ThemeMode: Int, CaseIterable {
    case system
    case lightMode
    case darkMode
    
    var description: String {
        switch self {
        case .system:
            "System"
        case .lightMode:
            "Light"
        case .darkMode:
            "Dark"
        }
    }
}

struct HomeTabView: View {
    @State private var isLoggedIn = false

    var body: some View {
        ZStack {
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
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
