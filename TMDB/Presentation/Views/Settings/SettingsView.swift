//
//  SettingsView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var session: SessionManager
    @Environment(\.user) var user: User
    @Environment(\.openURL) private var openURL
    @State private var isThemeSelected = false
    @State private var isWatchlistSelected = false
    @State private var isFavoriteSelected = false
    @State private var isAboutSelected = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 4) {
                    AsyncImage(url: user.imageURL) { image in
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
                    
                    Text(user.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(user.username)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    SettingListView(onItemTapped: settingItemTapped)
                    
                    FooterView()
                }
            }
            .scrollIndicators(.hidden)
            .background(Color("Background"))
            .navigationTitle("Settings")
            .navigationDestination(isPresented: $isFavoriteSelected) {
                FavoriteMoviesView()
            }
            .navigationDestination(isPresented: $isWatchlistSelected) {
                WatchlistMoviesView()
            }
            .navigationDestination(isPresented: $isThemeSelected) {
                ThemeView()
            }
            .navigationDestination(isPresented: $isAboutSelected) {
                AboutView()
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
            openURL(URL(string: "https://www.twitter.com/vinothvino42")!)
        case 4:
            openURL(URL(string: "https://www.linkedin.com/in/vinothvino42")!)
        case 5:
            isAboutSelected = true
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
