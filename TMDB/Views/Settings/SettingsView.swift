//
//  SettingsView.swift
//  TMDB
//
//  Created by Vinoth Vino on 18/09/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var session: SessionManager
    @State private var user: User?
    
    var body: some View {
        VStack(spacing: 6) {
            AsyncImage(url: URL(string: Constants.imageURL + (user?.image ?? ""))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.overlay(alignment: .center) {
                    ProgressView()
                }
            }
            .frame(width: 120, height: 120)
            .background(.green)
            .cornerRadius(.infinity)
            .padding(.bottom, 20)
            
            Text(user?.name ?? "Not Found")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(user?.username ?? "Not Found")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            SettingListView {
                session.signOut()
            }
            
            FooterView()
        }
        .onAppear {
            if let savedUser = UserDefaults.standard.object(forKey: UserDefaultKeys.user) as? Data {
                let user: User? = try? DataParser().parse(data: savedUser)
                self.user = user
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
