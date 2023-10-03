//
//  SettingListView.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import SwiftUI

struct SettingListView: View {
    var settings = Setting.getSettingItems()
    var onItemTapped: (Int) -> Void
    
    var body: some View {
        GroupBox {
            ForEach(Array(settings.enumerated()), id: \.element.id) { index, setting in
                VStack(spacing: 0) {
                    HStack {
                        Image(systemName: setting.icon)
                        Text(setting.title)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.secondary)
                    }
                    .padding([.vertical, .horizontal], 16)
                    .contentShape(Rectangle())
                    
                    Divider()
                }
                .onTapGesture {
                    onItemTapped(index)
                }
            }
        }
        .groupBoxStyle(PlainGroupBoxStyle())
        .padding(.vertical, 20)
    }
}

struct PlainGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.label
            configuration.content
        }
    }
}

#Preview {
    SettingListView(onItemTapped: { index in
        
    })
}
