//
//  Onboard.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import Foundation

class Onboard: Identifiable, Equatable {
    let id: UUID
    let image: String
    let title: String
    
    init(image: String, title: String) {
        self.id = UUID()
        self.image = image
        self.title = title
    }
    
    static func == (lhs: Onboard, rhs: Onboard) -> Bool {
        lhs.id == rhs.id
    }

    static func getOnboardItems() -> [Onboard] {
        [
            .init(image: "TMDBLogo", title: "Welcome to Unofficial TMDB"),
            .init(image: "Onboard1", title: "Discover Your Next Favorite Movie"),
            .init(image: "Onboard2", title: "Movies Anytime, Anywhere")
        ]
    }
}
