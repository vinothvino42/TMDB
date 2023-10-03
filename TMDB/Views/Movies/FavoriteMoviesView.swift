//
//  FavoriteMoviesView.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import Factory

struct FavoriteMoviesView: View {
    @StateObject private var favoriteListViewModel = Container.shared.favoriteViewModel()
    
    var body: some View {
        ZStack {
            if favoriteListViewModel.isLoading {
                HStack(spacing: 8) {
                    ProgressView()
                        .progressViewStyle(.circular)
                    Text("Loading")
                }
                .tint(.black.opacity(0.7))
                .foregroundStyle(.black.opacity(0.7))
            } else {
                if favoriteListViewModel.movies == nil {
                    ContentUnavailableView("No Favorite Movies", systemImage: "popcorn", description: Text("Browse most popular and trending movies"))
                } else {
                    List(favoriteListViewModel.movies!) { movie in
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
                await favoriteListViewModel.fetchMovies(with: .favoriteMovies(accountId: user.id))
            }
        }
    }
}

#Preview {
    FavoriteMoviesView()
}
