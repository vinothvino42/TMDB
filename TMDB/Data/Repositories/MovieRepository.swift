//
//  MovieRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

protocol MovieRepository {
    func getMovieDetail(movieId: Int) async throws -> Movie
    func getMovieCast(movieId: Int) async throws -> [Cast]
    func getMovieList(endpoint: MovieEndpoint) async throws -> [Movie]
    func searchMovies(query: String) async throws -> [Movie]
}

class MovieRepositoryImpl: MovieRepository {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getMovieDetail(movieId: Int) async throws -> Movie {
        do {
            let movie: Movie = try await client.executeRequest(with: MovieEndpoint.movieDetail(movieId: movieId))
            return movie
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 34 {
            throw MovieError.movieNotFound
        } catch {
            throw MovieError.unknown
        }
    }
    
    func getMovieCast(movieId: Int) async throws -> [Cast] {
        do {
            let movieCastResponse: MovieCastResponse = try await client.executeRequest(with: MovieEndpoint.movieCredits(movieId: movieId))
            return movieCastResponse.cast
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 34 {
            throw MovieError.movieNotFound
        } catch {
            throw MovieError.unknown
        }
    }
    
    func getMovieList(endpoint: MovieEndpoint) async throws -> [Movie] {
        do {
            let movieResponse: MovieResponse = try await client.executeRequest(with: endpoint)
            return movieResponse.results
        } catch {
            throw MovieError.movieList(type: "\(endpoint)")
        }
    }
    
    func searchMovies(query: String) async throws -> [Movie] {
        do {
            let movieResponse: MovieResponse = try await client.executeRequest(with: MovieEndpoint.searchMovies(query: query))
            return movieResponse.results
        } catch {
            throw MovieError.unknown
        }
    }
}
