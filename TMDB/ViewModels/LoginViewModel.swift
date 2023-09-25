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
        case error(AuthError)
    }
    
    @Published private(set) var state: State = .idle
    
    private let authRepository: AuthRepository
    private let accountRepository: AccountRepository
    
    var isLoading: Bool {
        return state == .loading
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
                        let user = try await accountRepository.getUserDetail(sessionId: sessionId!)
                        print("User name: \(user.name)")
                        print("Gravatar Hash: \(user.hash)")
                        print("TMDB Image: \(user.image)")
                        state = .success(user)
                    }
                }
            }
        } catch {
            state = .idle
            print(error)
//            if let authError = error as? AuthError {
//                state = .error(AuthError.userDetail)
//            } else {
//                print(error)
//            }
        }
    }
}
