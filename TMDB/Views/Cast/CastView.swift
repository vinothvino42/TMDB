//
//  CastView.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI
import Factory

struct CastView: View {
    let creditId: String
    
    @StateObject private var castViewModel: CastViewModel = Container.shared.castViewModel()
    
    var body: some View {
        ZStack {
            if castViewModel.isLoading {
                ProgressLoader()
            } else if castViewModel.person == nil {
                ContentUnavailableView("Cast Not Found", systemImage: "person")
            } else {
                let person = castViewModel.person!
                
                VStack {
                    AsyncImage(url: person.profileURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray.overlay(alignment: .center) {
                            ProgressView()
                        }
                    }
                    .frame(width: 100, height: 100)
                    .cornerRadius(.infinity)
                    .padding(.bottom, 6)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        LabelItem(title: "Name: ", value: person.name)
                        LabelItem(title: "Gender: ", value: person.genderText)
                        LabelItem(title: "Popularity: ", value: person.popularity.description)
                        LabelItem(title: "Department: ", value: person.knownForDepartment)
                    }
                }
            }
        }
        .task {
            await castViewModel.fetchCastDetail(creditId: creditId)
        }
    }
}

fileprivate struct LabelItem: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.title3)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
        }
    }
}
