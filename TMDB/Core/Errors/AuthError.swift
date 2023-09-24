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
    case sessionDenied
    case userNotFound
    case invalidUsernamePassword
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidApiKey:
            return "Oops! Please check your API Key. It's an invalid API Key"
        case .tokenExpired:
            return "Token is expired or invalid"
        case .sessionDenied:
            return "Session denied"
        case .userNotFound:
            return "User not found"
        case .invalidUsernamePassword:
            return "Please check your username and/or password"
        case .unknown:
            return "Something went wrong"
        }
    }
}
