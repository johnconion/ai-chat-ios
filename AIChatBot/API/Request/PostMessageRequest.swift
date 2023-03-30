//
//  HogeRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct PostMessageRequest: BaseRequest {
    typealias ResponseType = MessageResponse
    typealias RequestParams = PostMessageReequestParams
    
    var params: PostMessageReequestParams
    
    init(latestUserMessage: String) {
        params = PostMessageReequestParams(latestUserMessage: latestUserMessage)
    }
    
    var method: RequestMethod = .post
    var path: String = "conversations"
    
    struct PostMessageReequestParams: Codable {
        let latestUserMessage: String
    }
}
