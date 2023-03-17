//
//  BaseRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

protocol BaseRequest {
    associatedtype ResponseType
    
    var method: String { get }
    var baseURL: URL { get }
    var path: String { get }
    var data: Data? { get }
}

extension BaseRequest {
    
    var baseURL: URL {
        return URL(string: "https://example.com")!
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(self.path))
        urlRequest.httpMethod = self.method
        if let data = self.data {
            urlRequest.httpBody = data
        }
        return urlRequest
    }
}
