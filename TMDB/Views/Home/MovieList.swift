//
//  MovieList.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct MovieList: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Latest Releases")
                .font(.headline)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(1...20, id: \.self) { _ in
                        AsyncImage(url: URL(string: "https://pbs.twimg.com/media/FGGhymwVIAMJUDd.jpg:large")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Color.green
                        }
                        .frame(width: 100, height: 140)
                        .background(.green)
                        .clipped()
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
