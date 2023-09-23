//
//  AuthRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 22/09/23.
//

import Foundation

typealias RequestToken = String
typealias SessionID = String

protocol AuthRepositoryProtocol {
    func getRequestToken() async throws -> RequestToken
    func verifyRequestToken(username: String, password: String) async throws -> RequestToken
    func createSession(requestToken: RequestToken) -> Bool
    func deleteSession(sessionId: SessionID) -> Bool
}

class AuthRepository: AuthRepositoryProtocol {
    func getRequestToken() async throws -> RequestToken {
        fatalError("getRequestToken() has not been implemented")
    }
    
    func verifyRequestToken(username: String, password: String) async throws -> RequestToken {
        fatalError("verifyRequestToken(username:password) has not been implemented")
    }
    
    func createSession(requestToken: RequestToken) -> Bool {
        fatalError("createSession(requestToken:) has not been implemented")
    }
    
    func deleteSession(sessionId: SessionID) -> Bool {
        fatalError("deleteSession(sessionId:) has not been implemented")
    }
    
    
}
