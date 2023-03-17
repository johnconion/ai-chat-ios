//
//  ApiErrorResponse.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct ApiErrorResponse: Codable {
    /// エラー理由
    let reason: String
    /// 説明文（日本語）
    let description: String
}
