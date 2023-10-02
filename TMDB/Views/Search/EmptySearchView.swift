//
//  EmptySearchView.swift
//  TMDB
//
//  Created by Vinoth Vino on 02/10/23.
//

import SwiftUI

struct EmptySearchView: View {
    let isNotSearched: Bool
    let searchText: String
    
    var body: some View {
        if isNotSearched {
            ContentUnavailableView("Explore", systemImage: "popcorn", description: Text("Browse most popular and trending movies"))
        } else {
            ContentUnavailableView(
                "No Movies for \"\(searchText)\"",
                systemImage: "doc.richtext.fill",
                description: Text("Try to search for another movie")
            )
        }
    }
}
