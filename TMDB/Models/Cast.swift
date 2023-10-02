//
//  Cast.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct CastResponse: Decodable, Hashable {
    let id: Int
    let cast: [Cast]
}

struct Cast: Decodable, Hashable {
    let id: Int
    let name: String
    let popularity: Double
    let profilePath: String?
    
    var profileURL: URL? {
        URL(string: Constants.imageURL + (profilePath ?? ""))
    }
}
