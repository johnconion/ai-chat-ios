//
//  BaseRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

protocol BaseRequest {
    associatedtype ResponseType
    
    var method: RequestMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var data: [String:String]? { get }
}

extension BaseRequest {
    
    var contentType: String {
        return "application/json"
    }
    
    var accept: String {
        return "application/json"
    }
    
    var baseURL: URL {
        return URL(string: "https://crouton.tokyo/server/angousan/angousan_api.php")!
    }
    
    func asURLRequest() throws -> URLRequest {
        var compnents = URLComponents(url: baseURL.appendingPathComponent(self.path), resolvingAgainstBaseURL: true)!
        if method == .get {
            compnents.queryItems = data?.map{ URLQueryItem(name: $0.key, value: $0.value) }
        }
        var urlRequest = URLRequest(url: compnents.url!)
        urlRequest.httpMethod = self.method.rawValue
        urlRequest.addValue(contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.addValue(accept, forHTTPHeaderField: "Accept")
        if let data = self.data {
            if self.method != .get {
                urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            }
        }
        return urlRequest
    }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}
