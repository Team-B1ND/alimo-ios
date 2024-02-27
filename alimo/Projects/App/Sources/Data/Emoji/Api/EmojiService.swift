//
//  EmojiService.swift
//  App
//
//  Created by dgsw8th71 on 2/27/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

fileprivate let client = AlimoHttpClient.live

final class EmojiService {
    
    private let emojiPath = "/emoji"
    
    func patchEmoji(notificationId: Int, emoji: String) async throws -> Response {
        try await client.request("\(emojiPath)/status/\(notificationId)", Response.self, method: .patch)
    }
    
    func loadEmoji(notificationId: Int) async throws -> [Emoji] {
        try await client.request("\(emojiPath)/load/\(notificationId)", [EmojiResponse].self).map { $0.toDomain() }
    }
    
}

extension EmojiService {
    static let live = EmojiService()
}
