//
//  ProgressLoader.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import SwiftUI

struct ProgressLoader: View {
    var body: some View {
        HStack(spacing: 8) {
            ProgressView()
                .progressViewStyle(.circular)
            Text("Loading")
        }
    }
}

#Preview {
    ProgressLoader()
}
