//
//  MovieListView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI
import NukeUI

struct MovieListView: View {
    let title: String
    let isLoading: Bool
    let movies: [Movie]?
    
    var body: some View {
        if movies == nil || movies!.isEmpty {
            MovieListLoaderView()
        } else {
            VStack(alignment: .leading, spacing: 10) {
                Text(title + " Movies")
                    .font(.headline)
                    .fontWeight(.bold)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 4) {
                        ForEach(movies!, id: \.self) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollDisabled(movies == nil || movies!.isEmpty)
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(title: "Trending", isLoading: false, movies: [])
    }
}
