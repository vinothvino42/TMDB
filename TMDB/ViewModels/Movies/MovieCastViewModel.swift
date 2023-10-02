//
//  MovieCastViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 02/10/23.
//

import Foundation

class MovieCastViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published var casts: [Cast]?
    
    public var movieCastError: Error?
    
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
            let casts = try await movieRepository.getMovieCast(movieId: movieId)
            self.casts = casts
            state = .idle
        } catch {
            hasError = true
            movieCastError = error
            state = .idle
        }
    }
}


