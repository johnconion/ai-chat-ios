//
//  ChatMessage.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/19.
//

import UIKit

protocol ChatMessage {
    let id: UUID
    let sentDate: Date
}
