//
//  ChatUserMessage.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/19.
//

import UIKit

struct ChatUserMessage: ChatMessage {
    let id: UUID
    let sentDate: Date
    let timeString: String
    let sender: ChatSender
    let messageText: String
}
