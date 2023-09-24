//
//  MovieError.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

enum MovieError: LocalizedError {
    case invalidMovieId
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidMovieId:
            return "Movie not found"
        case .unknown:
            return "Something went wrong"
        }
    }
}
