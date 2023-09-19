//
//  MovieEndpoint.swift
//  TMDB
//
//  Created by Vinoth Vino on 19/09/23.
//

import Foundation

enum MovieEndpoint: Endpoint {
    case movieDetail(movieId: String)
    case movieCredits(movieId: String)
    case addToFavorite(accountId: String, sessionId: String)
    case addToWatchlist(accountId: String, sessionId: String)
    case popularMovies
    case topRatedMovies
    case upcomingMovies
    case romanceMovies
    case actionMovies
    case thrillerMovies
    
    var path: String {
        switch self {
        case .movieDetail(let movieId):
            return "movie/\(movieId)"
        case .movieCredits(let movieId):
            return "movie/\(movieId)/credits"
        case .addToFavorite(let accountId, _):
            return "account/\(accountId)/favorite"
        case .addToWatchlist(let accountId, _):
            return "account/\(accountId)/watchlist"
        case .popularMovies:
            return "movie/popular"
        case .topRatedMovies:
            return "movie/top_rated"
        case .upcomingMovies:
            return "movie/upcoming"
        case .romanceMovies, .actionMovies, .thrillerMovies:
            return "discover/movie"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .romanceMovies:
            return [.init(name: "with_genres", value: "10749")]
        case .actionMovies:
            return [.init(name: "with_genres", value: "28")]
        case .thrillerMovies:
            return [.init(name: "with_genres", value: "53")]
        default:
            return nil
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .addToFavorite, .addToWatchlist:
            return .post
        default:
            return .get
        }
    }
}
