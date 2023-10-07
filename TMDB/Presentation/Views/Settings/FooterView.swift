//
//  FooterView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("App Version 1.0.0")
            Text("Made with ☕️ and ❤️ by Vinoth")
        }
        .font(.caption)
        .padding(.bottom)
    }
}

#Preview {
    FooterView()
}
