//
//  AlimoAvatarType.swift
//  App
//
//  Created by dgsw8th71 on 2/3/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

enum AlimoAvatarType {
    case small
    case medium
    case large
    
    var size: CGFloat {
        switch self {
        case .small: 32
        case .medium: 36
        case .large: 100
        }
    }
}
