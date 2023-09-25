//
//  NetworkManager.swift
//  TMDB
//
//  Created by Vinoth Vino on 20/09/23.
//

import Foundation

protocol APIClient {
    var session: URLSession { get }
    func executeRequest<T: Decodable>(with endpoint: Endpoint, body: [String: String]) async throws -> T
    func makeURLRequest(endpoint: Endpoint) -> URLRequest?
}

// The default value is not supported in method parameters of protocol
extension APIClient {
    func executeRequest<T: Decodable>(with endpoint: Endpoint, body: [String: String] = [:]) async throws -> T {
        try await executeRequest(with: endpoint, body: body)
    }
}

final class APIClientImpl: APIClient {
    static private let scheme = "https"
    static private let host = "api.themoviedb.org"
    static private let path = "/3/"
    
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func executeRequest<T: Decodable>(with endpoint: Endpoint, body: [String: String] = [:]) async throws -> T {
        guard var urlRequest = makeURLRequest(endpoint: endpoint) else {
            throw NetworkError.invalidURL
        }
        if endpoint.method != .get {
            urlRequest.httpBody = try? JSONEncoder().encode(body)
        }
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
                let serverError: ServerError = try DataParser().parse(data: data)
                switch serverError.statusCode {
                case 7:
                    throw AuthError.invalidApiKey
                case 46:
                    throw NetworkError.serverError
                default:
                    throw NetworkError.invalidResponse(serverError: serverError)
                }
            }
            
            let decoded: T = try DataParser().parse(data: data)
            return decoded
        } catch {
            if (error is DecodingError) {
                throw NetworkError.decodingError
            }
            throw error
        }
    }
    
    func makeURLRequest(endpoint: Endpoint) -> URLRequest? {
        var components = URLComponents()
        components.scheme = APIClientImpl.scheme
        components.host = APIClientImpl.host
        components.path = APIClientImpl.path + endpoint.path
        components.queryItems = [URLQueryItem(name: "api_key", value: "")]
        components.queryItems?.append(contentsOf: endpoint.queryItems ?? [])
        
        guard let url = components.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 30)
        urlRequest.httpMethod = endpoint.method.rawValue
        endpoint.headers.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key) }
        return urlRequest
    }
}
