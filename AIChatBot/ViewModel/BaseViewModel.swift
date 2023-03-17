//
//  BaseViewModel.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

class BaseViewModel: NSObject {
    private var cancellables = Set<AnyCancellable>()
    
    override init() {
        super.init()
        print("\(className): init()")
    }
}
