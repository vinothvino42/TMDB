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
    
    // TODO: DI
    @ObservedObject var loginViewModel = LoginViewModel(authRepo: AuthRepository())
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack(spacing: 50) {
                Image(.tmdbLogo)
                
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        Image(systemName: "person.fill")
                        TextField("Username", text: $username)
                            .focused($focusField, equals: .username)
                            .submitLabel(.next)
                            .onSubmit {
                                focusField = .password
                            }
                    }
                    .decoratedField()
                    
                    HStack(spacing: 20) {
                        Image(systemName: "lock.fill")
                        SecureField("Password", text: $password)
                            .focused($focusField, equals: .password)
                            .submitLabel(.done)
                            .onSubmit {
                                focusField = nil
                            }
                    }
                    .decoratedField()
                    
                    SubmitButton(title: "Sign In", isLoading: false) {
                        if username.isEmpty {
                            focusField = .username
                        } else if password.isEmpty {
                            focusField = .password
                        } else {
                            focusField = nil
                            print("Sign In button tapped")
                            loginViewModel.login(username: username, password: password)
                        }
                    }
            
                    HStack {
                        Text("Dont have an account?")
                        Link("Sign Up",
                              destination: URL(string: "https://www.themoviedb.org/signup")!
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LoginView()
}
