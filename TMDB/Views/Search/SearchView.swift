//
//  SearchView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI
import NukeUI
import Factory

struct SearchView: View {
    @StateObject private var searchViewModel = Container.shared.searchMovieViewModel()
    
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    if searchViewModel.state == .loading {
                        ProgressLoader()
                            .frame(width: proxy.size.width, height: proxy.size.height, alignment: .center)
                    } else if searchViewModel.movies.isEmpty {
                        EmptySearchView(
                            isNotSearched: searchViewModel.movies.isEmpty,
                            searchText: searchViewModel.searchText
                        )
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    } else {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(searchViewModel.movies) { movie in
                                MovieCard(movie: movie)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .searchable(text: $searchViewModel.searchText, prompt: Text("Movies and more"))
            }
            .padding(.horizontal)
            .background(Color("Background"))
            .navigationTitle("Search")
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailView(movieId: movie.id)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
