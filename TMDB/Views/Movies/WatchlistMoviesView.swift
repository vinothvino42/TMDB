//
//  WatchlistMoviesView.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import Factory

struct WatchlistMoviesView: View {
    @Environment(\.user) var user: User
    @StateObject private var watchlistViewModel = Container.shared.watchlistViewModel()
    
    var body: some View {
        ZStack {
            if watchlistViewModel.isLoading {
                ProgressLoader()
            } else {
                if watchlistViewModel.movies == nil {
                    ContentUnavailableView("No Watchlist Movies", systemImage: "popcorn", description: Text("Browse most popular and trending movies"))
                } else {
                    MovieListView(movies: watchlistViewModel.movies!)
                }
            }
        }
        .navigationTitle("Watchlist")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await watchlistViewModel.fetchMovies(with: .watchlistMovies(accountId: user.id))
        }
    }
}

#Preview {
    WatchlistMoviesView()
}
