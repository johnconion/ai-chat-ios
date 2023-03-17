//
//  ViewController.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class ViewController: BaseViewController {
    
    private let viewModel = SampleViewModel()
    
    @IBOutlet weak var testLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func subscribeValues() {
        viewModel.$address
            .assignOnMainThread(to: \.text, on: testLabel)
            .disposed(by:self)
    }

    override func fetch() {
        viewModel.fetch()
    }
    
    @IBAction func fetchButton(_ sender: Any) {
        fetch()
    }
}

