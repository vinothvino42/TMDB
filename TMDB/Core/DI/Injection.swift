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
        Factory(self) { APIClient() }
    }
}

// MARK: - Injecting Repositories
extension Container {
    var authRepository: Factory<AuthRepository> {
        Factory(self) { AuthRepository(client: self.apiClient()) }
    }
    
    var accountRepository: Factory<AccountRepository> {
        Factory(self) { AccountRepository(client: self.apiClient()) }
    }
    
    var movieRepository: Factory<MovieRepository> {
        Factory(self) { MovieRepository(client: self.apiClient()) }
    }
}

// MARK: - Injecting ViewModels
extension Container {
    var loginViewModel: Factory<LoginViewModel> {
        Factory(self) { LoginViewModel(authRepository: self.authRepository(), accountRepository: self.accountRepository()) }
    }
}
