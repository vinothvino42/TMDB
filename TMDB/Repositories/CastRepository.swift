//
//  CastRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import Foundation

protocol CastRepository {
    func getCastDetail(creditId: String) async throws -> Person
}

class CastRepositoryImpl: CastRepository {
    private let client: APIClient
    
    init(client: APIClient) {
        self.client = client
    }
    
    func getCastDetail(creditId: String) async throws -> Person {
        do {
            let castResponse: CastResponse = try await client.executeRequest(with: CastEndpoint.castDetail(creditId: creditId))
            return castResponse.person
        } catch {
            throw MovieError.castNotFound
        }
    }
}

