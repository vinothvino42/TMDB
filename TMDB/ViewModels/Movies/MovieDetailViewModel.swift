//
//  MovieDetailViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 01/10/23.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published var movie: Movie?
    
    public var movieError: Error?
    
    public var isLoading: Bool {
        state == .loading
    }
    
    private let movieRepository: MovieRepository
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }
    
    @MainActor func fetchMovies(movieId: Int) async {
        state = .loading
        do {
            let movieDetail = try await movieRepository.getMovieDetail(movieId: movieId)
            self.movie = movieDetail
            state = .idle
        } catch {
            hasError = true
            movieError = error
            state = .idle
        }
    }
}

