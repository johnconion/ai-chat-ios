//
//  HogeResponse.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

/// 天気予報
struct WeatherForecast: Codable {
    /// 住所
    let address: String
    /// 天気情報
    let weathers: [Weather]
}

/// 天気情報
struct Weather: Codable {
    /// 時間(0-23)
    let time: Int
    /// 天気種別
    let weatherType: WeatherType
    /// 降水確率
    let rainyPercent: Int
}

/// 天気種別
enum WeatherType: Int, Codable {
    case sunny = 0
    case cloudy = 1
    case rain = 2
    
    func toString() -> String {
        switch self {
        case .sunny: return "晴れ"
        case .cloudy: return "曇り"
        case .rain: return "雨"
        }
    }
}
