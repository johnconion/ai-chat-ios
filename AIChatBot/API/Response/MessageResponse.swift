//
//  HogeResponse.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct MessageResponse: Codable {
    // ステータス
    let status: String
    // AIの返答
    let aiMessage: String
    // エラーメッセージ
    let errorMessage: String
}
