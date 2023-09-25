//
//  MovieError.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

enum MovieError: LocalizedError {
    case movieNotFound
    case movieList(type: String)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .movieNotFound:
            return "Movie not found"
        case .movieList(let type):
            return "Failed to get movie \(type) list"
        case .unknown:
            return "Something went wrong"
        }
    }
}
