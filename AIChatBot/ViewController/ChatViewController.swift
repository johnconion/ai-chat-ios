//
//  ViewController.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class ChatViewController: BaseViewController {
    
    private let viewModel = HogeViewModel()
    
    @IBOutlet weak var inputMessageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func subscribeValues() {
        super.subscribeValues()
    }
    
    override func setupLayout() {
        super.setupLayout()
        inputMessageTextView.clipCorner(radius: 8)
    }

    override func fetch() {
        super.fetch()
    }
    
    @IBAction func fetchButton(_ sender: Any) {
        fetch()
    }
}

