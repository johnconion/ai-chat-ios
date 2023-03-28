//
//  AngouRepository.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class MessageRepository {
    func send(message: String) async throws -> MessageResponse {
        let request = PostMessageRequest(latestUserMessage: message)
        let result = try await ApiClient.request(request)
        return result // TODO:一旦APIのレスポンスをそのまま返しているだけ
    }
}
