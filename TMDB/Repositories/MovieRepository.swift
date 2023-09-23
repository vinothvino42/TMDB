//
//  MovieRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

protocol MovieRepositoryProtocol {
    func getMovieDetail(movieId: Int) -> Movie
    func getMovieCast(movieId: Int) -> [Cast]
    func getPopularMovies() -> [Movie]
    func getTopRatedMovies() -> [Movie]
    func getUpcomingMovies() -> [Movie]
    func getRomanceMovies() -> [Movie]
    func getActionMovies() -> [Movie]
    func getThrillerMovies() -> [Movie]
}

class MovieRepository: MovieRepositoryProtocol {
    func getMovieDetail(movieId: Int) -> Movie {
        fatalError("getMovieDetail(movieId:) has not been implemented")
    }
    
    func getMovieCast(movieId: Int) -> [Cast] {
        fatalError("getMovieCast(movieId:) has not been implemented")
    }
    
    func getPopularMovies() -> [Movie] {
        fatalError("getPopularMovies() has not been implemented")
    }
    
    func getTopRatedMovies() -> [Movie] {
        fatalError("getTopRatedMovies() has not been implemented")
    }
    
    func getUpcomingMovies() -> [Movie] {
        fatalError("getUpcomingMovies() has not been implemented")
    }
    
    func getRomanceMovies() -> [Movie] {
        fatalError("getRomanceMovies() has not been implemented")
    }
    
    func getActionMovies() -> [Movie] {
        fatalError("getActionMovies() has not been implemented")
    }
    
    func getThrillerMovies() -> [Movie] {
        fatalError("getThrillerMovies(m) has not been implemented")
    }
}
