//
//  MovieListViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 30/09/23.
//

import Foundation

class MovieListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published private(set) var movies: [Movie]?
    
    public var isLoading: Bool {
        state == .loading
    }
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    @MainActor func fetchMovies(with endpoint: MovieEndpoint) async {
        state = .loading
        do {
            let movies = try await movieRepository.getMovieList(endpoint: endpoint)
            self.movies = movies
            state = .idle
        } catch {
            self.movies = nil
            state = .idle
        }
    }
}
