//
//  Setting.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import Foundation

struct Setting: Identifiable {
    let id: UUID = UUID()
    let icon: String
    let title: String
    
    static func getSettingItems() -> [Setting] {
        [
            .init(icon: "sun.max", title: "Theme"),
            .init(icon: "person.badge.plus", title: "Follow on Twitter"),
            .init(icon: "person.badge.plus", title: "Follow on LinkedIn"),
            .init(icon: "rectangle.portrait.and.arrow.right", title: "Logout"),
        ]
    }
}
