//
//  HogeRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct PostAngouRequest: BaseRequest {
    typealias ResponseType = AngouResponse
    
    let inputString: String
    let encryptKey: String
    
    var method: RequestMethod {
        return .post
    }
    
    var path: String {
        return ""
    }
    
    var data: [String:String]? {
        return [
            "type": "encrypt",
            "input_str": inputString,
            "input_key": encryptKey
        ]
    }
}
