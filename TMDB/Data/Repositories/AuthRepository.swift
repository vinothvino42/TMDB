//
//  AuthRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 22/09/23.
//

import Foundation

protocol AuthRepository {
    func getRequestToken() async throws -> RequestToken?
    func verifyRequestToken(requestToken: RequestToken, username: String, password: String) async throws -> RequestToken?
    func createSession(requestToken: RequestToken)  async throws -> SessionID?
    func deleteSession(sessionId: SessionID) async throws -> Bool
}

class AuthRepositoryImpl: AuthRepository {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getRequestToken() async throws -> RequestToken? {
        do {
            let base: Base = try await client.executeRequest(with: AuthEndpoint.requestToken)
            return base.requestToken
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 33 {
            throw AuthError.tokenExpired
        }
    }
    
    func verifyRequestToken(requestToken: RequestToken, username: String, password: String) async throws -> RequestToken? {
        do {
            let data = ["request_token": requestToken, "username": username, "password": password]
            let base: Base = try await client.executeRequest(with: AuthEndpoint.verifyRequestToken, body: data)
            return base.requestToken
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 30 {
            throw AuthError.invalidUsernamePassword
        }
    }
    func createSession(requestToken: RequestToken) async throws -> SessionID? {
        do {
            let data = ["request_token": requestToken]
            let base: Base = try await client.executeRequest(with: AuthEndpoint.createSession, body: data)
            return base.sessionId
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 33 {
            throw AuthError.tokenExpired
        }
    }
    
    func deleteSession(sessionId: SessionID) async throws -> Bool {
        do {
            let data = ["session_id": sessionId]
            let base: Base = try await client.executeRequest(with: AuthEndpoint.deleteSession, body: data)
            return base.success
        } catch NetworkError.invalidResponse(let serverError) where serverError.statusCode == 17 {
            throw AuthError.sessionDenied
        }
    }
}
