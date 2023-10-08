//
//  OnboardInfoView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct OnboardInfoView: View {
    let onboard: Onboard
    
    @EnvironmentObject private var session: SessionManager
    @State private var showBtn = false
    
    var body: some View {
        VStack(spacing: 30) {
            Image(onboard.image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            Text(onboard.title)
                .font(.title2)
                .bold()
                .padding(.horizontal, 30)
                .multilineTextAlignment(.center)
                .accessibilityIdentifier("WelcomeMessage")
            
            if showBtn {
                Button(action: session.completeOnboarding) {
                    Text("Continue")
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                }
                .buttonStyle(.borderedProminent)
                .accessibilityIdentifier("ContinueButton")
            }
        }
        .onAppear {
            if onboard.image == "Onboard2" {
                withAnimation(.spring().delay(0.25)) {
                    showBtn = true
                }
            }
        }
    }
}

#Preview {
    OnboardInfoView(onboard: Onboard.getOnboardItems().first!)
}
