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
    
    enum RootKeys: String, CodingKey {
        case id, name, username, image
    }
    
    enum AvatarCodingKeys: String, CodingKey {
        case avatar
    }
    
    enum TmdbCodingKeys: String, CodingKey {
        case tmdb
    }
}

extension User {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        username = try container.decode(String.self, forKey: .username)
        
        // image
        let avatarContainer = try container.nestedContainer(keyedBy: AvatarCodingKeys.self, forKey: .image)
        let tmdbContainer = try avatarContainer.nestedContainer(keyedBy: TmdbCodingKeys.self, forKey: .avatar)
        image = try tmdbContainer.decode(String.self, forKey: .tmdb)
    }
}
