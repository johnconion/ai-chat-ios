//
//  SampleViewModel.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

final class ChatViewModel: BaseViewModel {
    
    private let repository = AngouRepository()
    
    @Published
    private(set) var messageList: [Message] = []
    
    func fetch(inputString: String) {
        Task.detached {
            do {
                // bind to Published params
                self.encryptedString = try await self.repository.encrypt(input: inputString, encryptKey: "danjs82")
            } catch(let error) {
                switch(error){
                default: print(error)
                }
            }
        }
    }
}
