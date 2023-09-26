//
//  ErrorState.swift
//  TMDB
//
//  Created by Vinoth Vino on 26/09/23.
//

import SwiftUI

struct ErrorState: Equatable, Identifiable {
    let id = UUID().uuidString
    let error: Error?
    
    static func == (lhs: ErrorState, rhs: ErrorState) -> Bool {
        lhs.id == rhs.id
    }
}

struct ErrorStateKey: PreferenceKey {
    static var defaultValue: ErrorState? = nil
    
    static func reduce(value: inout ErrorState?, nextValue: () -> ErrorState?) {
        value = nextValue()
    }
}
