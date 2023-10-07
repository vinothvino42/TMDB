//
//  AuthEndpoint.swift
//  TMDB
//
//  Created by Vinoth Vino on 19/09/23.
//

import Foundation

enum AuthEndpoint: Endpoint {
    case requestToken
    case verifyRequestToken
    case createSession
    case deleteSession
    
    var path: String {
        switch self {
        case .requestToken:
            "authentication/token/new"
        case .verifyRequestToken:
            "authentication/token/validate_with_login"
        case .createSession:
            "authentication/session/new"
        case .deleteSession:
            "authentication/session"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var method: RequestMethod {
        switch self {
        case .requestToken:
            return .get
        case .verifyRequestToken, .createSession:
            return .post
        case .deleteSession:
            return .delete
        }
    }
}
