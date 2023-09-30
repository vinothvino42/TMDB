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
        if isLoading {
            Color.orange
                .frame(minWidth: 300, maxHeight: 200)
                .overlay(alignment: .center) {
                    ProgressView()
                }
        } else if movies == nil || movies!.isEmpty {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: 10) {
                Text(title + " Movies")
                    .font(.headline)
                    .fontWeight(.bold)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 4) {
                        ForEach(movies!, id: \.self) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                LazyImage(url: movie.imageURL)
                                    .frame(width: 100, height: 140)
                                    .cornerRadius(6)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
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
