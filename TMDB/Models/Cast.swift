//
//  Cast.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct MovieCastResponse: Decodable, Hashable {
    let id: Int
    let cast: [Cast]
}

struct CastResponse: Decodable, Hashable {
    let id: String
    let person: Person
}

struct Cast: Decodable, Hashable {
    let id: Int
    let creditId: String
    let name: String
    let popularity: Double
    let profilePath: String?
    
    var profileURL: URL? {
        URL(string: Constants.imageURL + (profilePath ?? ""))
    }
}

struct Person: Decodable, Hashable {
    let id: Int
    let gender: Int
    let name: String
    let knownForDepartment: String
    let popularity: Double
    let profilePath: String?
    
    var profileURL: URL? {
        URL(string: Constants.imageURL + (profilePath ?? ""))
    }
    
    var genderText: String {
        return gender == 1 ? "Female" : "Male"
    }
}
