//
//  ServerError.swift
//  TMDB
//
//  Created by Vinoth Vino on 25/09/23.
//

import Foundation

struct ServerError: Codable {
    let statusCode: Int
    let statusMessage: String
    let success: Bool
}
