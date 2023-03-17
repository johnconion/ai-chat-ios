//
//  Extensons.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit
import Combine

extension AnyCancellable {
    func disposed(in by: inout Set<AnyCancellable>){
        self.store(in: &by)
    }
}

extension Published.Publisher where Self.Failure == Never {
    func assignOnMainThread<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output?>, on object: Root) -> AnyCancellable {
        self.map{ $0 }.receive(on: DispatchQueue.main).assign(to: keyPath, on: object)
    }
}

extension NSObject {
    var className: String {
        return String(describing: type(of: self)) // ClassName
    }
}
