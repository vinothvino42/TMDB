//
//  NetworkError.swift
//  TMDB
//
//  Created by Vinoth Vino on 20/09/23.
//

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case badRequest
    case decodingError
    case invalidData
    case invalidResponse(serverError: ServerError)
    case serverError
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .badRequest:
            return "Bad Request"
        case .decodingError:
            return "Failed to parse data"
        case .invalidData:
            return "Failed to get data"
        case .invalidResponse(let serverError):
            return "Invalid response from URL: \(String(describing: serverError))"
        case .serverError:
            return "The API is undergoing maintenance. Try again later"
        case .unknown:
            return "Unknown error occured"
        }
    }
}

