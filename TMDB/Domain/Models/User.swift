//
//  User.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import SwiftUI

struct UserKey: EnvironmentKey {
    static let defaultValue: User = User()
}

extension EnvironmentValues {
    var user: User {
        get { self[UserKey.self] }
        set { self[UserKey.self] = newValue }
    }
}

struct User: Codable, Equatable {
    let id: Int
    let name: String
    let username: String
    let image: String
    
    init(id: Int, name: String, username: String, image: String) {
        self.id = id
        self.name = name
        self.username = username
        self.image = image
    }
    
    var imageURL: URL? {
        URL(string: Constants.imageURL + image)
    }
    
    enum RootKeys: String, CodingKey {
        case id, name, username, avatar
    }
    
    enum AvatarCodingKeys: String, CodingKey {
        case gravatar, tmdb
    }
    
    enum TmdbCodingKeys: String, CodingKey {
        case avatarPath
    }
}

// Convenience init for creating a empty user
extension User {
    init() {
        self.init(id: 0, name: "", username: "", image: "")
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
