//
//  DependencyInjection.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation
import Factory

// MARK: - Injecting Services
extension Container {
    var apiClient: Factory<APIClient> {
        Factory(self) { APIClientImpl() }
    }
}

// MARK: - Injecting Repositories
extension Container {
    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryImpl(client: self.apiClient()) }
    }
    
    var accountRepository: Factory<AccountRepository> {
        Factory(self) { AccountRepositoryImpl(client: self.apiClient()) }
    }
    
    var movieRepository: Factory<MovieRepository> {
        Factory(self) { MovieRepositoryImpl(client: self.apiClient()) }
    }
    
    var castRepository: Factory<CastRepository> {
        Factory(self) { CastRepositoryImpl(client: self.apiClient()) }
    }
}

// MARK: - Injecting ViewModels
extension Container {
    var loginViewModel: Factory<LoginViewModel> {
        Factory(self) { LoginViewModel(authRepository: self.authRepository(), accountRepository: self.accountRepository()) }
    }
    
    var popularMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var topRatedMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var upcomingMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var romanceMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var actionMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var thrillerMovieViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var favoriteViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var watchlistViewModel: Factory<MovieListViewModel> {
        Factory(self) { MovieListViewModel(movieRepository: self.movieRepository()) }
    }
    
    var movieDetailViewModel: Factory<MovieDetailViewModel> {
        Factory(self) { MovieDetailViewModel(movieRepository: self.movieRepository()) }
    }
    
    var movieCastViewModel: Factory<MovieCastViewModel> {
        Factory(self) { MovieCastViewModel(movieRepository: self.movieRepository()) }
    }
    
    var searchMovieViewModel: Factory<SearchViewModel> {
        Factory(self) { SearchViewModel(movieRepository: self.movieRepository()) }
    }
    
    var castViewModel: Factory<CastViewModel> {
        Factory(self) { CastViewModel(castRepository: self.castRepository()) }
    }
}
