//
//  SettingsView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var session: SessionManager
    @Environment(\.openURL) private var openURL
    @State private var user: User?
    @State private var isThemeSelected = false
    @State private var isWatchlistSelected = false
    @State private var isFavoriteSelected = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    AsyncImage(url: user?.imageURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.overlay(alignment: .center) {
                            ProgressView()
                        }
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(.infinity)
                    .padding(.bottom, 6)
                    
                    Text(user?.name ?? "Not Found")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(user?.username ?? "Not Found")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    SettingListView(onItemTapped: settingItemTapped)
                    
                    FooterView()
                }
            }
            .background(Color("Background"))
            .navigationTitle("Settings")
            .navigationDestination(isPresented: $isThemeSelected) {
                ThemeView()
            }
            .navigationDestination(isPresented: $isWatchlistSelected) {
                WatchlistMoviesView()
            }
            .navigationDestination(isPresented: $isFavoriteSelected) {
                FavoriteMoviesView()
            }
        }
        .onAppear {
            if let savedUser = UserDefaults.standard.object(forKey: UserDefaultKeys.user) as? Data {
                let user: User? = try? DataParser().parse(data: savedUser)
                self.user = user
            }
        }
    }
    
    private func settingItemTapped(index: Int) {
        switch index {
        case 0:
            isFavoriteSelected = true
        case 1:
            isWatchlistSelected = true
        case 2:
            isThemeSelected = true
        case 3:
            print("Twitter")
            openURL(URL(string: "https://www.twitter.com/vinothvino42")!)
        case 4:
            openURL(URL(string: "https://www.linkedin.com/in/vinothvino42")!)
        default:
            session.signOut()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
