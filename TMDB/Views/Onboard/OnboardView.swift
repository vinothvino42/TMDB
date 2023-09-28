//
//  OnboardView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct OnboardView: View {
    private var onboardItems = Onboard.getOnboardItems()
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            TabView {
                ForEach(onboardItems) { item in
                    OnboardInfoView(onboard: item)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    OnboardView()
}
