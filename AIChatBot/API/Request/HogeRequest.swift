//
//  HogeRequest.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct HogeRequest: BaseRequest {
    typealias ResponseType = WeatherForecast
    
    var method: String {
        return "GET"
    }
    
    var path: String {
        return "/forecast"
    }
    
    var data: Data? {
        return nil
    }
}
