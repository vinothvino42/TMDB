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
    let backdropPath: String?
    let posterPath: String?
    let voteAverage: Double?
    let runtime: Int?
    let releaseDate: String?
    let genres: [Genre]?
    let video: Bool
    
    var hasVideo: Bool {
        video
    }
    
    var backdropURL: URL? {
        URL(string: Constants.posterURL + (backdropPath ?? ""))
    }
    
    var posterURL: URL? {
        URL(string: Constants.posterURL + (posterPath ?? ""))
    }
    
    var ratingText: String {
        String(format: "%.1f", voteAverage ?? 0.0) + " / 10"
    }
    
    var genreText: String {
        var text = ""
        if genres != nil {
            for (index, genre) in genres!.enumerated() {
                if !genre.name.isEmpty {
                    let appendText = index == genres!.count - 1 ? "" : " | "
                    text += genre.name + appendText
                }
            }
        }
        return text
    }
    
    var durationText: String {
        if runtime != nil {
            return Utils.getMovieDuration(runtime: runtime!)
        }
        return "Not Found"
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
