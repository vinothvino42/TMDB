//
//  CastEndpoint.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import Foundation

enum CastEndpoint: Endpoint {
    case castDetail(creditId: String)
    
    var path: String {
        switch self {
        case .castDetail(let creditId):
            return "credit/\(creditId)"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var method: RequestMethod {
        return .get
    }
}
