//
//  Alert+Default.swift
//  TMDB
//
//  Created by Vinoth Vino on 26/09/23.
//

import SwiftUI

extension View {
    func alert(isPresented: Binding<Bool>, title: String? = nil, message: String?, dismissButton: Alert.Button? = nil) -> some View {
        alert(isPresented: isPresented) {
            Alert(title: Text(title ?? "Error"),
                  message: Text(message ?? "Unknown Error"),
                  dismissButton: dismissButton)
        }
    }
}
