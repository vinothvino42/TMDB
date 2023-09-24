//
//  MovieRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovieDetail(movieId: Int) async throws -> Movie
    func getMovieCast(movieId: Int) async throws -> [Cast]
    func getMovieList(endpoint: MovieEndpoint) async throws -> [Movie]
}

class MovieRepository: MovieRepositoryProtocol {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getMovieDetail(movieId: Int) async throws -> Movie {
        let movie: Movie = try await client.executeRequest(with: MovieEndpoint.movieDetail(movieId: movieId))
        return movie
    }
    
    func getMovieCast(movieId: Int) async throws -> [Cast] {
        let casts: [Cast] = try await client.executeRequest(with: MovieEndpoint.movieCredits(movieId: movieId))
        return casts
    }
    
    func getMovieList(endpoint: MovieEndpoint) async throws -> [Movie] {
        let movies: [Movie] = try await client.executeRequest(with: endpoint)
        return movies
    }
}
