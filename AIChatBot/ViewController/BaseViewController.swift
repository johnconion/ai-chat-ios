//
//  BaseViewController.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

protocol BaseViewProtocol {
    func subscribeValues()
    func fetch()
}

class BaseViewController: UIViewController, BaseViewProtocol {
    var subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(className): viewDidLoad()")
        subscribeValues()
    }
    
    func subscribeValues() {
        print("\(className): subscribeValues()")
    }
    
    func fetch() {
        print("\(className): fetch()")
    }
}

extension AnyCancellable {
    func disposed(by: BaseViewController){
        self.store(in: &by.subscriptions)
    }
}
