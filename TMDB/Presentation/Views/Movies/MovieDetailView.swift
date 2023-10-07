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
                ProgressLoader()
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
                        
                        VStack(alignment: .leading, spacing: 6) {
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
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text(movie?.genreText ?? "Not Found")
                                    .lineLimit(2)
                                    .fontWeight(.medium)
                                
                                Text(movie?.overview ?? "Not Found")
                                    .font(.callout)
                                    .foregroundColor(.secondary)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(5)
                            }
                            .padding(.vertical, 12)
                            
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
        await movieCastViewModel.fetchMovieCasts(movieId: movieId)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 2)
    }
}
