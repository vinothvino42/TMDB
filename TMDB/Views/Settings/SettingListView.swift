//
//  SettingListView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct SettingListView: View {
    var settings = Setting.getSettingItems()
    var onItemTapped: () -> Void
    
    var body: some View {
        List(settings) { setting in
            HStack {
                Image(systemName: setting.icon)
                Text(setting.title)
                Spacer()
            }
            .contentShape(Rectangle())
            .padding(.vertical, 6)
            .onTapGesture(perform: onItemTapped)
        }
        .scrollDisabled(true)
    }
}

#Preview {
    SettingListView(onItemTapped: {})
}
