//
//  AccountRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

protocol AccountRepositoryProtocol {
    func getUserDetail(sessionId: SessionID) async throws -> User
}

class AccountRepository: AccountRepositoryProtocol {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getUserDetail(sessionId: SessionID) async throws -> User {
        let user: User = try await client.executeRequest(with: AccountEndpoint.userDetail(sessionId: sessionId))
        return user
    }
}
