//
//  SettingsView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


struct SettingListTile: View {
    var body: some View {
        HStack {
            Image(systemName: "house")
            VStack {
                Text("Account Sesttings")
                Text("Download quality storage & more")
            }
            Image(systemName: "house")
        }
    }
}
