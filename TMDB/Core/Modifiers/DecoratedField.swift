//
//  DecoratedField.swift
//  TMDB
//
//  Created by Vinoth Vino on 21/09/23.
//

import SwiftUI

struct DecoratedField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 16)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .foregroundStyle(Color(.textFieldGray))
            )
    }
}

extension View {
    func decoratedField() -> some View {
        modifier(DecoratedField())
    }
}
