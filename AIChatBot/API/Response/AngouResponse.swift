//
//  HogeResponse.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

struct AngouResponse: Codable {
    // input
    let inputStr: String
    // input_key
    let inputKey: String
    // output
    let output: String
}
