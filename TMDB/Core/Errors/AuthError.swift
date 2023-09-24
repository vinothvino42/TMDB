//
//  AuthError.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

enum AuthError: LocalizedError {
    case invalidApiKey
    case tokenExpired
    case sessionExpired
    case userNotFound
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidApiKey:
            return "Please check your API Key"
        case .tokenExpired:
            return "Token Expired"
        case .sessionExpired:
            return "Session Expired"
        case .userNotFound:
            return "User not found"
        case .unknown:
            return "Something went wrong"
        }
    }
}
