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
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    if searchViewModel.movies.isEmpty {
                        EmptySearchView(
                            isNotSearched: searchViewModel.movies.isEmpty,
                            searchText: searchViewModel.searchText
                        )
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    } else if searchViewModel.state == .loading {
                        MovieListLoaderView()
                    } else {
                        LazyVGrid(columns: columns, spacing: 4) {
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
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
