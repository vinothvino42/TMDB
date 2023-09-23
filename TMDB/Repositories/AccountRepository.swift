//
//  AccountRepository.swift
//  TMDB
//
//  Created by Vinoth Vino on 23/09/23.
//

import Foundation

protocol AccountRepositoryProtocol {
    func getUserDetail() -> User
}

class AccountRepository: AccountRepositoryProtocol {
    func getUserDetail() -> User {
        fatalError("getUserDetail() has not been implemented")
    }
}
