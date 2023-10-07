//
//  CastViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 03/10/23.
//

import Foundation

class CastViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published public var hasError: Bool = false
    @Published var person: Person?
    
    public var castError: Error?
    
    public var isLoading: Bool {
        state == .loading
    }
    
    private let castRepository: CastRepository
    
    init(castRepository: CastRepository) {
        self.castRepository = castRepository
    }
    
    @MainActor func fetchCastDetail(creditId: String) async {
        state = .loading
        do {
            let person = try await castRepository.getCastDetail(creditId: creditId)
            self.person = person
            state = .idle
        } catch {
            hasError = true
            castError = error
            state = .idle
        }
    }
}



