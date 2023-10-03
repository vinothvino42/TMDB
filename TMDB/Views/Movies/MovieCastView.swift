//
//  MovieCastView.swift
//  TMDB
//
//  Created by Vinoth Vino on 02/10/23.
//

import SwiftUI
import NukeUI

struct MovieCastView: View {
    let casts: [Cast]?
    
    var body: some View {
        if casts == nil || casts!.isEmpty {
            MovieListLoaderView()
        } else {
            VStack(alignment: .leading, spacing: 16) {
                Text("Cast")
                    .font(.headline)
                    .fontWeight(.bold)
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 4) {
                        ForEach(casts!, id: \.self) { cast in
                            NavigationLink {
                                CastView(creditId: cast.creditId)
                            } label: {
                                LazyImage(url: cast.profileURL) { state in
                                    if let image = state.image {
                                        image
                                            .resizable()
                                    } else {
                                        Color.gray.overlay(alignment: .center) {
                                            ProgressView()
                                        }
                                    }
                                }
                                .frame(width: 110, height: 160)
                                .scaledToFill()
                                .cornerRadius(6)
                                .shadow(radius: 4)
                            }

                        }
                    }
                }
                .scrollIndicators(.hidden)
                .scrollDisabled(casts == nil || casts!.isEmpty)
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    MovieCastView(casts: [])
}
