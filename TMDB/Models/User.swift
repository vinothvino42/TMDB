//
//  User.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

struct User: Codable {
    let id: Int
    let name: String
    let username: String
    let image: String
    let hash: String
    
    enum RootKeys: String, CodingKey {
        case id, name, username, avatar
    }
    
    enum AvatarCodingKeys: String, CodingKey {
        case gravatar, tmdb
    }
    
    enum GravatarCodingKeys: String, CodingKey {
        case hash
    }
    
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
        
        let gravatarContainer = try avatarContainer.nestedContainer(keyedBy: GravatarCodingKeys.self, forKey: .gravatar)
        hash = try gravatarContainer.decode(String.self, forKey: .hash)

        let tmdbContainer = try avatarContainer.nestedContainer(keyedBy: TmdbCodingKeys.self, forKey: .tmdb)
        image = try tmdbContainer.decode(String.self, forKey: .avatarPath)
    }
}
