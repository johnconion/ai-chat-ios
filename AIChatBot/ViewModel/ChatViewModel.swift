//
//  SampleViewModel.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

final class ChatViewModel: BaseViewModel {
    
    private let repository = MessageRepository()
    
    @Published
    private(set) var messageList: [ChatMessagesPerDay] = []
    
    func sendMessage(message: String) async throws {
        // TODO 超ゴリ押し実装 Postの結果を強引に見る作り、ローカル変数に返信突っ込むだけ実装
        let messageHistory = (messageList.first?.messages ?? [])
        let allMessages = messageHistory + [ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "now", sender: .me, messageText: message)]
        messageList = [ChatMessagesPerDay(dateString: "今日", messages: allMessages)]
        
        let result = try await repository.send(message: message)
        if result.status == "ok" {
            let messageHistory = (messageList.first?.messages ?? [])
            let allMessages = messageHistory + [ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "now", sender: .character, messageText: result.aiMessage)]
            messageList = [ChatMessagesPerDay(dateString: "今日", messages: allMessages)]
        } else {
            let messageHistory = (messageList.first?.messages ?? [])
            let allMessages = messageHistory + [ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "now", sender: .character, messageText: "error")]
            messageList = [ChatMessagesPerDay(dateString: "今日", messages: allMessages)]
        }
    }
    
    //    func fetch() {
    //        self.messageList = [
    //            ChatMessagesPerDay(dateString: "3/15(火)", messages: [
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "11:01", sender: .character, messageText: "こんにちは！\n先日はありがとう！\nまた今度ゆっくり話したいです😁"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "13:14", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "13:14", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "13:14", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:20", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:20", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:20", sender: .character, messageText: "返信はまだかな？？？？？")
    //                ]),
    //            ChatMessagesPerDay(dateString: "3/16(水)", messages: [
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "20:01", sender: .character, messageText: "返信はまだかな？？？？？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "15:21", sender: .me, messageText: "すみません、どなたでしょうか？"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "18:51", sender: .me, messageText: "割とガチできしょいです")]),
    //            ChatMessagesPerDay(dateString: "今日", messages: [
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "5:45", sender: .character, messageText: "未読スルーするな"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "7:10", sender: .character, messageText: "お前をみているぞ"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:29", sender: .me, messageText: "ブロックします"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:30", sender: .character, messageText: "よくわかりました"),
    //                ChatUserMessage(id: UUID(), sentDate: Date(), timeString: "19:30", sender: .character, messageText: "夜道に気をつけて")
    //                ])
    //        ]
    //    }
}
