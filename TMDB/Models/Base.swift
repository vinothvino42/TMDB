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
}
