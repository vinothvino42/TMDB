//
//  Movie.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let description: String
    let image: String
    let video: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title, video
        case description = "overview"
        case image = "poster_path"
    }
}
