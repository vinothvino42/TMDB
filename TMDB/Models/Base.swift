//
//  Base.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation

typealias RequestToken = String
typealias SessionID = String

struct Base: Decodable {
    let success: Bool
    let expiresAt: String
    let requestToken: RequestToken?
    let sessionId: SessionID?
    
    enum CodingKeys: String, CodingKey {
        case success, expiresAt, requestToken, sessionId
    }
}

extension Base {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        expiresAt = try container.decodeIfPresent(String.self, forKey: .expiresAt) ?? ""
        requestToken = try container.decodeIfPresent(String.self, forKey: .requestToken) ?? nil
        sessionId = try container.decodeIfPresent(String.self, forKey: .sessionId) ?? nil
    }
}
