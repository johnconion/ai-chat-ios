//
//  ViewController.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class ChatViewController: BaseViewController {
    
    private let viewModel = ChatViewModel()
    
    @IBOutlet weak var messageTableVeiw: UITableView!
    @IBOutlet weak var inputMessageTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableVeiw.register(ChatMyMessageTableViewCell.self, forCellReuseIdentifier: "chat_my_message_cell")
        messageTableVeiw.register(ChatOthersMessageTableViewCell.self, forCellReuseIdentifier: "chat_others_message_cell")
    }
    
    override func subscribeValues() {
        super.subscribeValues()
    }
    
    override func setupLayout() {
        super.setupLayout()
        inputMessageTextView.clipCorner(radius: 8)
        sendButton.clipCorner(radius: 8)
    }

    override func fetch() {
        super.fetch()
    }
    
    @IBAction func fetchButton(_ sender: Any) {
        fetch()
    }
}

