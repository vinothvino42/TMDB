//
//  AuthRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 22/09/23.
//

import Foundation

protocol AuthRepositoryProtocol {
    func getRequestToken() async throws -> RequestToken?
    func verifyRequestToken(requestToken: RequestToken, username: String, password: String) async throws -> RequestToken?
    func createSession(requestToken: RequestToken)  async throws -> SessionID?
    func deleteSession(sessionId: SessionID) async throws -> Bool
}

class AuthRepository: AuthRepositoryProtocol {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getRequestToken() async throws -> RequestToken? {
        let base: Base = try await client.executeRequest(with: AuthEndpoint.requestToken)
        return base.requestToken
    }
    
    func verifyRequestToken(requestToken: RequestToken, username: String, password: String) async throws -> RequestToken? {
        let data = ["request_token": requestToken, "username": username, "password": password]
        let base: Base = try await client.executeRequest(with: AuthEndpoint.verifyRequestToken, body: data)
        return base.requestToken
    }
    func createSession(requestToken: RequestToken) async throws -> SessionID? {
        let data = ["request_token": requestToken]
        let base: Base = try await client.executeRequest(with: AuthEndpoint.createSession, body: data)
        return base.sessionId
    }
    
    func deleteSession(sessionId: SessionID) async throws -> Bool {
        let data = ["session_id": sessionId]
        let base: Base = try await client.executeRequest(with: AuthEndpoint.deleteSession, body: data)
        return base.success
    }
}
