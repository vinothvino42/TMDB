//
//  Endpoint.swift
//  TMDB
//
//  Created by Vinoth Vino on 19/09/23.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

protocol Endpoint {
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
    var method: RequestMethod { get }
    var locale: String { get }
    var region: String { get }
}

extension Endpoint {
    var locale: String {
        return Locale.current.language.languageCode?.identifier ?? "en-US"
    }
    
    var region: String {
        return Locale.current.region?.identifier ?? "IN"
    }
}
