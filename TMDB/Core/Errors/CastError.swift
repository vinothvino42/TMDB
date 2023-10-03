//
//  CastError.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import Foundation

enum CastError: LocalizedError {
    case castNotFound
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .castNotFound:
            return "Cast not found"
        case .unknown:
            return "Something went wrong"
        }
    }
}
