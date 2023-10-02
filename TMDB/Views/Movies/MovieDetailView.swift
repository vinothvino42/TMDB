//
//  MovieDetailView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI
import NukeUI
import Factory

struct MovieDetailView: View {
    @StateObject private var movieDetailViewModel = Container.shared.movieDetailViewModel()
    @StateObject private var movieCastViewModel = Container.shared.movieCastViewModel()
    
    let movieId: Int
    
    var body: some View {
        ZStack {
            if movieDetailViewModel.isLoading {
                HStack(spacing: 8) {
                    ProgressView()
                        .progressViewStyle(.circular)
                    Text("Loading")
                }
                .tint(.black.opacity(0.7))
                .foregroundStyle(.black.opacity(0.7))
            } else {
                let movie = movieDetailViewModel.movie
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        AsyncImage(url: movie?.backdropURL) { image in
                            image
                                .resizable()
                        } placeholder: {
                            Color.gray.overlay(alignment: .center) {
                                ProgressView()
                            }
                        }
                        .aspectRatio(16/9, contentMode: .fit)
                        .padding(.bottom, 10)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(movie?.title ?? "Not Found")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("\(movie?.releaseDate ?? "Not Found") - \(movie?.durationText ?? "Not Found")")
                            
                            HStack {
                                RatingView(rating: 5, maxRating: 5)
                                if movie?.ratingText != nil {
                                    Text(movie!.ratingText)
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text(movie?.genreText ?? "Not Found")
                                    .lineLimit(2)
                                    .fontWeight(.medium)
                                
                                Text(movie?.overview ?? "Not Found")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(5)
                            }
                            .padding(.vertical, 20)
                            
                            MovieCastView(casts: movieCastViewModel.casts)
                        }
                        .padding(.horizontal)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .task {
            await fetchMovieDetail()
            await fetchMovieCasts()
        }
    }
    
    private func fetchMovieDetail() async {
        await movieDetailViewModel.fetchMovies(movieId: movieId)
    }
    
    private func fetchMovieCasts() async {
        await movieCastViewModel.fetchMovies(movieId: movieId)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 2)
    }
}

struct RatingView: View {
    struct ClipShape: Shape {
        let width: Double
        
        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }
    
    let rating: Double
    let maxRating: Int
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<maxRating, id: \.self) { _ in
                Text(Image(systemName: "star"))
                    .foregroundColor(.yellow)
                    .aspectRatio(contentMode: .fill)
            }
        }.overlay(
            GeometryReader { reader in
                HStack(spacing: 0) {
                    ForEach(0..<maxRating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .aspectRatio(contentMode: .fit)
                    }
                }
                .clipShape(
                    ClipShape(width: (reader.size.width / CGFloat(maxRating)) * CGFloat(rating))
                )
            }
        )
    }
}
