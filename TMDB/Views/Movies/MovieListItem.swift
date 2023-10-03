//
//  MovieListItem.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import NukeUI

struct MovieListItem: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            LazyImage(url: movie.posterURL) { state in
                if let image = state.image {
                    image
                        .resizable()
                } else {
                    Color.gray.overlay(alignment: .center) {
                        ProgressView()
                    }
                }
            }
            .frame(width: 70, height: 70)
            .scaledToFill()
            .cornerRadius(6)
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.title3)
                
                Text(movie.overview)
                    .font(.footnote)
                    .lineLimit(2)
            }
        }
    }
}
