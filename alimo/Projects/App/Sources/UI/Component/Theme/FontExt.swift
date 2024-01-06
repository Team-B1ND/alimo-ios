//
//  Text.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

extension Font {
    
    // pretendard
    static let title = Font.custom(Pretendard.bold.rawValue, size: 24)
    static let subtitle = Font.custom(Pretendard.bold.rawValue, size: 20)
    static let body = Font.custom(Pretendard.bold.rawValue, size: 16)
    static let bodyLight = Font.custom(Pretendard.medium.rawValue, size: 16)
    static let label = Font.custom(Pretendard.medium.rawValue, size: 14)
    static let caption = Font.custom(Pretendard.medium.rawValue, size: 12)
    static let cute = Font.custom(Pretendard.medium.rawValue, size: 10)
}

enum Pretendard: String {
    
    case bold = "Pretendard-Bold"
    case medium = "Pretendard-Medium"
}
