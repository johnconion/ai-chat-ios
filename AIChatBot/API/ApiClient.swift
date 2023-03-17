//
//  ApiClient.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

final class ApiClient {
    
    private static let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    // Combine
    static func request<T, V>(_ request: T) -> AnyPublisher<V, Error> where T: BaseRequest, V: Codable, T.ResponseType == V {
        let urlRequest = try! request.asURLRequest()
        return URLSession.shared
            .dataTaskPublisher(for: urlRequest)
            .map({ $0.data })
            .decode(type: V.self, decoder: ApiClient.decoder)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // SwiftConcurrency
    static func request<T, V>(_ request: T) async throws -> V where T: BaseRequest, V: Codable, T.ResponseType == V {
        let urlRequest = try! request.asURLRequest()
        print("Request: " + urlRequest.url!.absoluteString)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else { throw ApiError.notHttpUrlResponse }
        guard response.statusCode == 200 else { throw try ApiError.map(response.statusCode, data: data) }
        if let data = String(data: data, encoding: .utf8) {
            print("data: " + data)
        }
        let value = try ApiClient.decoder.decode(V.self, from: data)
        return value
    }
}
