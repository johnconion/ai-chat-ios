//
//  SampleViewModel.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

final class SampleViewModel: BaseViewModel {
    
    @Published
    private(set) var address: String = "取得中"
    
    func fetch() {
        Task.detached {
            self.address = "WASSA"
            do {
                let request = PostAngouRequest(inputString: "Test", encryptKey: "WASSA")
                let result = try await ApiClient.request(request)
                // bind to Published params
                self.address = result.output
            } catch(let error) {
                switch(error){
                default: print(error)
                }
            }
        }
    }
}
