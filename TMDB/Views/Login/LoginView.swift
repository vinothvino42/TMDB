//
//  LoginView.swift
//  TMDB
//
//  Created by Vinoth Vino on 21/09/23.
//

import SwiftUI

struct LoginView: View {
    enum LoginField: Hashable {
        case username, password
    }
    
    @State private var username = ""
    @State private var password = ""
    @FocusState private var focusField: LoginField?
    
    var body: some View {
        VStack(spacing: 50) {
            Image(.tmdbLogo)
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    Image(systemName: "person.fill")
                    TextField("Username", text: $username)
                        .focused($focusField, equals: .username)
                        .onSubmit {
                            focusField = .password
                        }
                }
                .decoratedField()
                
                HStack(spacing: 20) {
                    Image(systemName: "lock.fill")
                    SecureField("Password", text: $password)
                        .focused($focusField, equals: .password)
                        .onSubmit {
                            focusField = nil
                        }
                }
                .decoratedField()
                
                Button {
                    if username.isEmpty {
                        focusField = .username
                    } else if password.isEmpty {
                        focusField = .password
                    } else {
                        focusField = nil
                        print("Sign In button tapped")
                    }
                } label: {
                    Text("Sign In")
                        .frame(maxWidth: .infinity, minHeight: 40)
                        .foregroundStyle(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 6, style: .continuous)
                        )
                }
                
                HStack {
                    Text("Dont have an account?")
                    Button("Sign Up") {
                        print("Sign Up button tapped")
                    }
                }
            }
        }
        .padding(.horizontal)
        .background(Color("Background"))
    }
}

#Preview {
    LoginView()
}
