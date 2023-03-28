//
//  ChatMessageTableViewCell.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/19.
//

import UIKit

class ChatMyMessageTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageBackgroundView: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBackgroundView.clipCorner(radius: 8)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
