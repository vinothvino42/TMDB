//
//  SearchViewModel.swift
//  TMDB
//
//  Created by Vinoth Vino on 02/10/23.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    enum State {
        case idle
        case loading
    }
    
    @Published private(set) var state: State = .idle
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var filteredMovies: [Movie]?
    @Published var searchText: String = ""
    
    private let movieRepository: MovieRepository
    private var cancellables = Set<AnyCancellable>()
    public var isLoading: Bool {
        state == .loading
    }
    
    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.8, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .handleEvents(receiveOutput: { output in
                self.state = .loading
            })
            .setFailureType(to: MovieError.self)
            .flatMap { query in
                Future<[Movie], MovieError> { promise in
                    if query.isEmpty {
                        return promise(.success([]))
                    }
                    Task {
                        do {
                            let results: [Movie] = try await self.movieRepository.searchMovies(query: query)
                            promise(.success(results))
                        } catch {
                            promise(.failure(.searchNotFound(query: query)))
                        }
                    }
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            .handleEvents(receiveOutput: { output in
                self.state = .idle
            })
            .sink { _ in
                print("Received")
            } receiveValue: { movies in
                self.movies = movies
            }
            .store(in: &cancellables)
    }
}
