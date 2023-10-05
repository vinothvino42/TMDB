//
//  HomeTabView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct HomeTabView: View {
    @State private var user: User = User()
    
    var body: some View {
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
        .environment(\.user, user)
        .onAppear {
            if let savedUser = UserDefaults.standard.object(forKey: UserDefaultKeys.user) as? Data, let user: User = try? DataParser().parse(data: savedUser) {
                self.user = user
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
