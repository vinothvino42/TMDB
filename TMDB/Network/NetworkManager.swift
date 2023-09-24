//
//  NetworkManager.swift
//  TMDB
//
//  Created by Vinoth Vino on 20/09/23.
//

import Foundation

protocol APIClientProtocol {
    var session: URLSession { get }
    func executeRequest<T: Decodable>(with endpoint: Endpoint, body: [String: String]) async throws -> T
    func makeURLRequest(endpoint: Endpoint) -> URLRequest?
}

final class APIClient: APIClientProtocol {
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
                print(response)
                throw NetworkError.invalidURLResponse(url: urlRequest.url)
            }
            
            let decoded: T = try DataParser().parse(data: data)
            return decoded
        } catch {
            if (error is DecodingError) {
                throw NetworkError.decodingError
            }
            throw NetworkError.serverError
        }
    }
    
    func makeURLRequest(endpoint: Endpoint) -> URLRequest? {
        var components = URLComponents()
        components.scheme = APIClient.scheme
        components.host = APIClient.host
        components.path = APIClient.path + endpoint.path
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
