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
            .init(icon: "icon", title: "Theme"),
            .init(icon: "icon", title: "Follow on Twitter"),
            .init(icon: "icon", title: "Follow on LinkedIn"),
            .init(icon: "icon", title: "Logout"),
        ]
    }
}
