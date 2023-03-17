//
//  ApiError.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

enum ApiError: Error {
    case aaa
    case bbb
    case ccc
    case notHttpUrlResponse
    case undefined
    
    private static let decoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    static func map(_ statusCode: Int, data: Data) throws -> ApiError {
        print("↓--API ERROR--↓")
        print("statusCode:\(statusCode)")
        let response = try decoder.decode(ApiErrorResponse.self, from: data)
        print("reason:" + response.reason)
        print("description:" + response.description)
        print("↑--API ERROR--↑")
        switch statusCode {
            case 404: switch response.reason {
                case "USER_NOT_FOUND": throw ApiError.aaa
                case "MESSAGE_NOT_FOUND": throw ApiError.bbb
                default: throw ApiError.undefined
            }
            case 502: throw ApiError.ccc
            default: throw ApiError.undefined
        }
    }
}
