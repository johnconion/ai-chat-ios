//
//  ViewController.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class ViewController: BaseViewController {
    
    private let viewModel = HogeViewModel()
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func subscribeValues() {
        super.subscribeValues()
        viewModel.$encryptedString
            .assignOnMainThread(to: \.text, on: resultLabel)
            .disposed(by:self)
    }

    override func fetch() {
        super.fetch()
        viewModel.fetch(inputString: inputTextView.text)
    }
    
    @IBAction func fetchButton(_ sender: Any) {
        fetch()
    }
}

