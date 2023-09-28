//
//  SessionManager.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import Foundation

final class SessionManager: ObservableObject {
    enum UserDefaultKeys {
        static let isOnboarded = "isOnboarded"
        static let isLoggedIn = "isLoggedIn"
    }
    enum CurrentState {
        case loggedIn
        case loggedOut
    }
    
    @Published private(set) var currentState: CurrentState?
    
    func configureInitialState() {
        let isOnboarded = UserDefaults.standard.bool(forKey: UserDefaultKeys.isOnboarded)
        let isLoggedIn = UserDefaults.standard.bool(forKey: UserDefaultKeys.isLoggedIn)
        
        if !isOnboarded {
            currentState = .none
        } else {
            currentState = isLoggedIn ? .loggedIn : .loggedOut
        }
    }
    
    func signIn() {
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.isLoggedIn)
        configureInitialState()
    }
    
    func signOut() {
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.isLoggedIn)
        configureInitialState()
    }
    
    func completeOnboarding() {
        currentState = .loggedOut
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.isOnboarded)
    }
}
