//
//  EmojiResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/27/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import ADS

struct EmojiResponse: Decodable {
    let emojiName: String
    let count: Int
}

extension EmojiResponse {
    func toDomain() -> Emoji {
        Emoji(emojiType: EmojiType.fromString(emojiName),
              count: count)
    }
}
