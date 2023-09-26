//
//  Alert+Default.swift
//  TMDB
//
//  Created by Vinoth Vino on 26/09/23.
//

import SwiftUI

extension View {
    func errorAlert(isPresenting: Binding<Bool>, error: Error?, title: String? = nil, message: String? = nil, dismissButton: Alert.Button? = nil) -> some View {
        alert(isPresented: isPresenting) {
            Alert(title: Text(title ?? "Error"),
                  message: Text(message ?? (error?.localizedDescription ?? "Unknown Error")),
                  dismissButton: dismissButton)
        }
    }
}
