//
//  MovieListLoaderView.swift
//  TMDB
//
//  Created by Vinoth Vino on 02/10/23.
//

import SwiftUI

struct MovieListLoaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Movies")
                .font(.headline)
                .fontWeight(.bold)
            ScrollView(.horizontal) {
                LazyHStack(spacing: 4) {
                    ForEach(0..<10) { _ in
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(width: 100, height: 140)
                            .cornerRadius(6)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollDisabled(true)
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
        .redacted(reason: .placeholder)
    }
}

#Preview {
    MovieListLoaderView()
}
