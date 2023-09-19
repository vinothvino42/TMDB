//
//  MovieDetailView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI
import AVKit

struct MovieDetailView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 8) {
//                VideoPlayer(player: AVPlayer(url:  URL(string: "https://download.samplelib.com/mp4/sample-30s.mp4")!))
//                    .frame(height: proxy.size.height / 3)
                Rectangle()
                    .frame(height: proxy.size.height / 3)
                    .foregroundColor(.green)
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Money Heist")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text("2019 - 2h 24m - Tamil")
                        
                        Button {
                            print("Watch now button tapped")
                        } label: {
                            HStack {
                                Image(systemName: "play.fill")
                                Text("Watch Now")
                            }
                            .frame(height: 35)
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.vertical, 8)
                        
                        Text("Drama | Thriller | Corrupton | Cop Drama | Cult Classics")
                            .lineLimit(1)
                            .fontWeight(.medium)
                        
                        Text("""
                             A criminal mastermind who goes by \"The Professor\" has a plan to pull off the biggest heist in recorded history -- to print billions of euros in the Royal Mint of Spain. To help him carry out the ambitious plan, he recruits eight people with certain abilities and who have nothing to lose
                             """)
                        .font(.callout)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
