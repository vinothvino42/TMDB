//
//  FavoriteMoviesView.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import Factory

struct FavoriteMoviesView: View {
    @Environment(\.user) var user: User
    @StateObject private var favoriteListViewModel = Container.shared.favoriteViewModel()
    
    var body: some View {
        ZStack {
            if favoriteListViewModel.isLoading {
                ProgressLoader()
            } else {
                if favoriteListViewModel.movies == nil {
                    ContentUnavailableView("No Favorite Movies", systemImage: "popcorn", description: Text("Browse most popular and trending movies"))
                } else {
                    MovieListView(movies: favoriteListViewModel.movies!)
                }
            }
        }
        .navigationTitle("Favorites")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await favoriteListViewModel.fetchMovies(with: .favoriteMovies(accountId: user.id))
        }
    }
}

#Preview {
    FavoriteMoviesView()
}

struct MovieListView: View {
    let movies: [Movie]
    
    var body: some View {
        List(movies) { movie in
            MovieListItem(movie: movie)
        }
        .background(Color("Background"))
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}
