//
//  RootView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct RootView: View {
    @State private var isLoggedIn = false
    
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
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
