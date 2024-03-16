//
//  EmojiType.swift
//  App
//
//  Created by dgsw8th71 on 2/27/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

enum EmojiType: String, CaseIterable {
    case okay = "OKAY"
    case love = "LOVE"
    case laugh = "LAUGH"
    case sad = "SAD"
    case angry = "ANGRY"
    
    static func fromString(_ str: String?) -> EmojiType? {
        for emojiType in EmojiType.allCases {
            if emojiType.rawValue == str {
                return emojiType
            }
        }
        return nil
    }
    
    var image: String {
        switch self {
        case .okay: "Ok"
        case .love: "heart"
        case .laugh: "funny"
        case .sad: "Sad"
        case .angry: "Angry"
        }
    }
}
