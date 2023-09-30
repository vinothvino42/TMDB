//
//  SessionManager.swift
//  TMDB
//
//  Created by Vinoth Vino on 28/09/23.
//

import Foundation

enum UserDefaultKeys {
    static let isOnboarded: String = "isOnboarded"
    static let isLoggedIn: String = "isLoggedIn"
    static let user: String = "user"
    static let sessionID: String = "sessionID"
}

final class SessionManager: ObservableObject {
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
    
    func signIn(user: User) {
        if let encodedUser = try? JSONEncoder().encode(user) {
            UserDefaults.standard.setValue(encodedUser, forKey: UserDefaultKeys.user)
            UserDefaults.standard.set(true, forKey: UserDefaultKeys.isLoggedIn)
            configureInitialState()
        }
    }
    
    func signOut() {
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.isLoggedIn)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.sessionID)
        UserDefaults.standard.removeObject(forKey: UserDefaultKeys.user)
        configureInitialState()
    }
    
    func completeOnboarding() {
        currentState = .loggedOut
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.isOnboarded)
    }
}
