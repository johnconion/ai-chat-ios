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
        subscribeValues()
    }
    
    func subscribeValues() {}
    func fetch() {}
}

extension AnyCancellable {
    func disposed(by: BaseViewController){
        self.store(in: &by.subscriptions)
    }
}
