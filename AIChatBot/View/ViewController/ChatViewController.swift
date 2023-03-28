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
        messageTableVeiw.register(UINib(nibName: "ChatMyMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "chat_my_message_cell")
        messageTableVeiw.register(UINib(nibName: "ChatOthersMessageTableViewCell", bundle: nil), forCellReuseIdentifier: "chat_others_message_cell")
        messageTableVeiw.dataSource = self
    }
    
    override func subscribeValues() {
        super.subscribeValues()
        viewModel.$messageList
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { value in
                print(value)
                self.messageTableVeiw.reloadData()
                guard let lastMessages = value.last else { return }
                self.messageTableVeiw.scrollToRow(at: IndexPath(row: lastMessages.messages.count - 1, section: value.count - 1), at: .bottom, animated: false)
            })
            .disposed(by: self)
    }
    
    override func setupLayout() {
        super.setupLayout()
        inputMessageTextView.clipCorner(radius: 8)
        sendButton.clipCorner(radius: 8)
    }

    override func fetch() {
        super.fetch()
        viewModel.fetch()
    }
    
    @IBAction func fetchButton(_ sender: Any) {
        fetch()
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.messageList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.messageList[section].dateString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.messageList[section].messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.messageList[indexPath.section].messages[indexPath.row] {
        case let userMessage as ChatUserMessage: return createUserMessageCell(tableView: tableView, indexPath: indexPath, userMessage: userMessage)
        default:
            return UITableViewCell()
        }
    }
    
    private func createUserMessageCell(tableView: UITableView, indexPath: IndexPath, userMessage: ChatUserMessage) -> UITableViewCell {
        switch userMessage.sender {
        case .me:
            let cell = tableView.dequeueReusableCell(withIdentifier: "chat_my_message_cell", for: indexPath) as! ChatMyMessageTableViewCell
            cell.messageLabel.text = userMessage.messageText
            cell.timeLabel.text = userMessage.timeString
            return cell
        case .character:
            let cell = tableView.dequeueReusableCell(withIdentifier: "chat_others_message_cell", for: indexPath) as! ChatOthersMessageTableViewCell
            cell.messageLabel.text = userMessage.messageText
            cell.timeLabel.text = userMessage.timeString
            return cell
        case .system:
            return UITableViewCell()
        }
    }
}
