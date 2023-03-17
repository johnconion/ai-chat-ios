//
//  AngouRepository.swift
//  AIChatBot
//
//  Created by Ryosuke Tamura on 2023/03/17.
//

import UIKit

class AngouRepository {
    func encrypt(input: String, encryptKey: String) async throws -> String {
        let request = PostAngouRequest(inputString: input, encryptKey: encryptKey)
        let result = try await ApiClient.request(request)
        return result.output
    }
}
