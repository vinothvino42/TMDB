//
//  ThemeView.swift
//  TMDB
//
//  Created by Vinoth Vino on 01/10/23.
//

import SwiftUI

struct ThemeView: View {
    @State private var currentScheme: ThemeMode = ThemeMode.system
    private var colorSchemes: [ThemeMode] = ThemeMode.allCases
    
    var body: some View {
        Form {
            Picker("Select Theme", selection: $currentScheme) {
                ForEach(colorSchemes, id: \.self) { scheme in
                    Text(scheme.description)
                }
            }
            .pickerStyle(.inline)
        }
        .onAppear {
            let selectedScheme = UserDefaults.standard.integer(forKey: UserDefaultKeys.themeMode)
            currentScheme = ThemeMode(rawValue: selectedScheme) ?? ThemeMode.system
        }
        .onChange(of: currentScheme, { oldValue, newValue in
            UserDefaults.standard.setValue(currentScheme.rawValue, forKey: UserDefaultKeys.themeMode)
        })
    }
}

#Preview {
    ThemeView()
}
