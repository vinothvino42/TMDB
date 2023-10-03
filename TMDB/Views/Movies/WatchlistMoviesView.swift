//
//  WatchlistMoviesView.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import Factory

import SwiftUI
import Factory

struct WatchlistMoviesView: View {
    @StateObject private var watchlistViewModel = Container.shared.watchlistViewModel()
    
    var body: some View {
        ZStack {
            if watchlistViewModel.isLoading {
                HStack(spacing: 8) {
                    ProgressView()
                        .progressViewStyle(.circular)
                    Text("Loading")
                }
                .tint(.black.opacity(0.7))
                .foregroundStyle(.black.opacity(0.7))
            } else {
                if watchlistViewModel.movies == nil {
                    ContentUnavailableView("No Watchlist Movies", systemImage: "popcorn", description: Text("Browse most popular and trending movies"))
                } else {
                    List(watchlistViewModel.movies!) { movie in
                        MovieListItem(movie: movie)
                    }
                    .background(Color("Background"))
                    .listStyle(.plain)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .task {
            if let savedUser = UserDefaults.standard.object(forKey: UserDefaultKeys.user) as? Data, let user: User = try? DataParser().parse(data: savedUser) {
                await watchlistViewModel.fetchMovies(with: .watchlistMovies(accountId: user.id))
            }
        }
    }
}

#Preview {
    WatchlistMoviesView()
}
