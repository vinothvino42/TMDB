//
//  HomeView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI
import Factory

struct HomeView: View {
    @EnvironmentObject private var session: SessionManager
    
    @ObservedObject private var popularMoviesViewModel = Container.shared.popularMovieViewModel()
    @ObservedObject private var topRatedMoviesViewModel = Container.shared.topRatedMovieViewModel()
    @ObservedObject private var upcomingMoviesViewModel = Container.shared.upcomingMovieViewModel()
    @ObservedObject private var romanceMoviesViewModel = Container.shared.romanceMovieViewModel()
    @ObservedObject private var actionMoviesViewModel = Container.shared.actionMovieViewModel()
    @ObservedObject private var thrillerMoviesViewModel = Container.shared.thrillerMovieViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                Group {
                    MovieHorizontalListView(title: "Popular", isLoading: popularMoviesViewModel.isLoading, movies: popularMoviesViewModel.movies)
                    MovieHorizontalListView(title: "Top Rated", isLoading: topRatedMoviesViewModel.isLoading, movies: topRatedMoviesViewModel.movies)
                    MovieHorizontalListView(title: "Upcoming", isLoading: upcomingMoviesViewModel.isLoading, movies: upcomingMoviesViewModel.movies)
                    MovieHorizontalListView(title: "Romance", isLoading: romanceMoviesViewModel.isLoading, movies: romanceMoviesViewModel.movies)
                    MovieHorizontalListView(title: "Action", isLoading: actionMoviesViewModel.isLoading, movies: actionMoviesViewModel.movies)
                    MovieHorizontalListView(title: "Thriller", isLoading: thrillerMoviesViewModel.isLoading, movies: thrillerMoviesViewModel.movies)
                }
                .listRowBackground(Color("Background"))
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .scrollIndicators(.hidden)
            .background(Color("Background"))
            .listStyle(.plain)
            .navigationTitle("Movies")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movieId: movie.id)
            }
        }
        .task {
            await fetchAllMovieList()
        }
    }
    
    func fetchAllMovieList() async {
        await popularMoviesViewModel.fetchMovies(with: .popularMovies)
        await topRatedMoviesViewModel.fetchMovies(with: .topRatedMovies)
        await upcomingMoviesViewModel.fetchMovies(with: .upcomingMovies)
        await romanceMoviesViewModel.fetchMovies(with: .romanceMovies)
        await actionMoviesViewModel.fetchMovies(with: .actionMovies)
        await thrillerMoviesViewModel.fetchMovies(with: .thrillerMovies)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(SessionManager())
    }
}
