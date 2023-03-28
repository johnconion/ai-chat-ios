//
//  HogeRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct PostMessageRequest: BaseRequest {
    typealias ResponseType = MessageResponse
    
    let latestUserMessage: String
    
    var method: RequestMethod {
        return .post
    }
    
    var path: String {
        return "conversations"
    }
    
    var data: [String:String]? {
        return [
            "latest_user_message": latestUserMessage
        ]
    }
}
