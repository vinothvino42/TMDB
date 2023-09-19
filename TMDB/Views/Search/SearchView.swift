//
//  SearchView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(spacing: 12) {
                    Image(systemName: "magnifyingglass")
                    TextField("Search movies", text: $searchText)
                    Button {
                        print("Clear button tapped")
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .tint(.primary)
                }
                .padding(.vertical, 12)
                .padding(.horizontal, 10)
                .background(.gray.opacity(0.3))
                .cornerRadius(8)
                
                GeometryReader { proxy in
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 4) {
                            ForEach(0...12, id: \.self) { _ in
                                NavigationLink {
                                    MovieDetailView()
                                } label: {
                                    AsyncImage(url: URL(string: "https://pbs.twimg.com/media/FGGhymwVIAMJUDd.jpg:large")) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .clipped()
                                    } placeholder: {
                                        Color.green
                                    }
                                    .frame(width: proxy.size.width / 3, height: 160)
                                    .background(.green)
                                    .cornerRadius(6)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .padding(.horizontal)
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
