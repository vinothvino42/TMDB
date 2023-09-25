//
//  DependencyInjection.swift
//  TMDB
//
//  Created by Vinoth Vino on 24/09/23.
//

import Foundation
import Factory

// MARK: - Injecting Services
extension Container {
    var apiClient: Factory<APIClient> {
        Factory(self) { APIClientImpl() }
    }
}

// MARK: - Injecting Repositories
extension Container {
    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepositoryImpl(client: self.apiClient()) }
    }
    
    var accountRepository: Factory<AccountRepository> {
        Factory(self) { AccountRepositoryImpl(client: self.apiClient()) }
    }
    
    var movieRepository: Factory<MovieRepository> {
        Factory(self) { MovieRepositoryImpl(client: self.apiClient()) }
    }
}

// MARK: - Injecting ViewModels
extension Container {
    var loginViewModel: Factory<LoginViewModel> {
        Factory(self) { LoginViewModel(authRepository: self.authRepository(), accountRepository: self.accountRepository()) }
    }
}
