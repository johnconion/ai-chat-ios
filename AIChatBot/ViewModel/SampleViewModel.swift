//
//  SampleViewModel.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

final class SampleViewModel: BaseViewModel {
    
    private let repository = AngouRepository()
    
    @Published
    private(set) var address: String = "取得中"
    
    func fetch() {
        Task.detached {
            self.address = "WASSA"
            do {
                // bind to Published params
                self.address = try await self.repository.encrypt(input: "TestTest", encryptKey: "danjs82")
            } catch(let error) {
                switch(error){
                default: print(error)
                }
            }
        }
    }
}
