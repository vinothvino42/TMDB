//
//  User.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct User: Codable, Equatable {
    let id: Int
    let name: String
    let username: String
    let image: String
    
    enum RootKeys: String, CodingKey {
        case id, name, username, avatar
    }
    
    enum AvatarCodingKeys: String, CodingKey {
        case gravatar, tmdb
    }
    
//    enum GravatarCodingKeys: String, CodingKey {
//        case hash
//    }
    
    enum TmdbCodingKeys: String, CodingKey {
        case avatarPath
    }
}

extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        username = try container.decode(String.self, forKey: .username)
        
        // image
        let avatarContainer = try container.nestedContainer(keyedBy: AvatarCodingKeys.self, forKey: .avatar)

        let tmdbContainer = try avatarContainer.nestedContainer(keyedBy: TmdbCodingKeys.self, forKey: .tmdb)
        image = try tmdbContainer.decode(String.self, forKey: .avatarPath)
    }
}

extension User {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RootKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(username, forKey: .username)
        
        var avatarContainer = container.nestedContainer(keyedBy: AvatarCodingKeys.self, forKey: .avatar)
        
        var tmdbContainer = avatarContainer.nestedContainer(keyedBy: TmdbCodingKeys.self, forKey: .tmdb)
        try tmdbContainer.encode(image, forKey: .avatarPath)
    }
}
