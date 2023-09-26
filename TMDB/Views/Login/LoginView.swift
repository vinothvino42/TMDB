//
//  LoginView.swift
//  TMDB
//
//  Created by Vinoth Vino on 21/09/23.
//

import SwiftUI
import Factory

struct LoginView: View {
    enum LoginField: Hashable {
        case username, password
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @StateObject private var loginViewModel = Container.shared.loginViewModel()
    
    @FocusState private var focusField: LoginField?
    
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
                    
                    SubmitButton(title: "Sign In", isLoading: loginViewModel.isLoading) {
                        if username.isEmpty {
                            focusField = .username
                        } else if password.isEmpty {
                            focusField = .password
                        } else {
                            focusField = nil
                            loginUser()
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
            .errorAlert(isPresenting: $loginViewModel.showError, error: loginViewModel.loginError)
//            .preference(key: ErrorStateKey.self, value: ErrorState(error: loginViewModel.loginError))
        }
    }
    
    private func loginUser() {
        Task {
            await loginViewModel.login(username: username, password: password)
        }
    }
}

#Preview {
    LoginView()
}
