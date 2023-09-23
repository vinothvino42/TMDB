//
//  SubmitButton.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import SwiftUI

struct SubmitButton: View {
    let title: String
    let isLoading: Bool
    let loadingTitle: String
    let onTap: () -> Void
    
    init(title: String, isLoading: Bool, loadingTitle: String, onTap: @escaping () -> Void) {
        self.title = title
        self.isLoading = isLoading
        self.loadingTitle = loadingTitle
        self.onTap = onTap
    }
    
    var body: some View {
        if isLoading {
            ProgressView("Loading")
                .progressViewStyle(.horizontal)
                .frame(maxWidth: .infinity, minHeight: 45)
                .background(
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .fill(.blue)
                )
        } else {
            Button {
                onTap()
            } label: {
                Text(title)
                    .frame(maxWidth: .infinity, minHeight: 45)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                    )
                    .font(.title3)
            }
        }
    }
}

extension SubmitButton {
    init(title: String, onTap: @escaping () -> Void) {
        self.init(title: title, isLoading: false, loadingTitle: "Loading", onTap: onTap)
    }
    
    init(title: String, isLoading: Bool, onTap: @escaping () -> Void) {
        self.init(title: title, isLoading: isLoading, loadingTitle: "Loading", onTap: onTap)
    }
    
    init(title: String, loadingTitle: String, onTap: @escaping () -> Void) {
        self.init(title: title, isLoading: false, loadingTitle: loadingTitle, onTap: onTap)
    }
}

struct HorizontalProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 8) {
            ProgressView()
                .progressViewStyle(.circular)
            configuration.label
        }
        .tint(.white.opacity(0.7))
        .foregroundStyle(.white.opacity(0.7))
    }
}

extension ProgressViewStyle where Self == HorizontalProgressViewStyle {
    static var horizontal: HorizontalProgressViewStyle { .init() }
}


#Preview {
    SubmitButton(title: "Login") { }
}
