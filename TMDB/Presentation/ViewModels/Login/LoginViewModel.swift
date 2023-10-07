//
//  LoginViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 22/09/23.
//

import Foundation
import Factory

final class LoginViewModel: ObservableObject {
    enum State: Equatable {
        case idle
        case loading
        case success(User)
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    
    public var loginError: Error?
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    
    public var isLoading: Bool {
        state == .loading
    }
    
    init(authRepository: AuthRepository, accountRepository: AccountRepository) {
        self.authRepository = authRepository
        self.accountRepository = accountRepository
    }
    
    @MainActor
    func login(username: String, password: String) async {
        state = .loading
        do {
            let requestToken = try await authRepository.getRequestToken()
            if requestToken != nil {
                let verifiedToken = try await authRepository.verifyRequestToken(requestToken: requestToken!, username: username, password: password)
                if verifiedToken != nil {
                    let sessionId = try await authRepository.createSession(requestToken: verifiedToken!)
                    if sessionId != nil {
                        UserDefaults.standard.setValue(sessionId, forKey: UserDefaultKeys.sessionID)
                        let user = try await accountRepository.getUserDetail(sessionId: sessionId!)
                        state = .success(user)
                    }
                }
            }
        } catch {
            hasError = true
            state = .idle
            loginError = error
        }
    }
}
