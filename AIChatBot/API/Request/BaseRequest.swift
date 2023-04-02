//
//  BaseRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

protocol BaseRequest {
    associatedtype ResponseType: Codable
    associatedtype RequestParams: Codable
    var method: RequestMethod { get }
    var baseURL: URL { get }
    var header: [String:String] { get }
    var path: String { get }
    var params: RequestParams { get }
}

extension BaseRequest {
    
    var contentType: String {
        return "application/json"
    }
    
    var accept: String {
        return "application/json"
    }
    
    var baseURL: URL {
        return URL(string: "http://localhost:8080")!
    }
    
    var header: [String:String] {
#if DEBUG
        let aiChatApiKey = "3e7931a0f68ac090c531f2f416fb130fa2db0001e0b68da0671ad537f30ef518"
#else
        let aiChatApiKey = ""
#endif
        return [
            "AICHAT-API-KEY" : aiChatApiKey,
            "AICHAT-USER-ID" : "temp_user_id",
            "Content-Type" : contentType,
            "Accept" : accept
        ]
    }
    
    func asURLRequest() throws -> URLRequest {
        var compnents = URLComponents(url: baseURL.appendingPathComponent(self.path), resolvingAgainstBaseURL: true)!
        if method == .get {
            compnents.queryItems = paramsToDict(params: params)?.filter{ $0.value as? String != nil }.map{ URLQueryItem(name: $0.key, value: ($0.value as! String)) }
        }
        var urlRequest = URLRequest(url: compnents.url!)
        urlRequest.httpMethod = self.method.rawValue
        header.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        if let data = self.paramsToDict(params: params) {
            if self.method != .get {
                urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            }
        }
        return urlRequest
    }
    
    private func paramsToDict(params: RequestParams) -> [String:Any]? {
        let jsonEncoder = JSONEncoder()
        // snakeCaseへの変換を指定
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
        do {
            let json = try jsonEncoder.encode(params)
            return try JSONSerialization.jsonObject(with: json, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}
