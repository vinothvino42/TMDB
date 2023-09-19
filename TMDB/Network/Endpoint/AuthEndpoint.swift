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
    case userDetail(sessionId: String)
    
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
        case .userDetail:
            "account"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        if case let .userDetail(sessionId) = self {
            return [.init(name: "session_id", value: sessionId)]
        }
        return nil
    }
    
    var method: RequestMethod {
        switch self {
        case .requestToken, .userDetail:
            return .get
        case .verifyRequestToken, .createSession:
            return .post
        case .deleteSession:
            return .delete
        }
    }
}
