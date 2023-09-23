//
//  Cast.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct Cast {
    let id: Int
    let name: String
    let popularity: Double
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, popularity
        case image = "profile_path"
    }
}
