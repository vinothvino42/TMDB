//
//  Movie.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let video: Bool
    
    var hasVideo: Bool {
        video
    }
    
    var imageURL: URL? {
        URL(string: Constants.posterURL + posterPath)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
