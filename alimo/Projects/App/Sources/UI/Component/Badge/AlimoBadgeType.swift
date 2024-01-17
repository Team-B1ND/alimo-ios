//
//  AlimoBadgeType.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

enum AlimoBadgeType {
    case small
    case medium
    case large
    
    var width: CGFloat {
        return switch self {
        case .small: 8
        case .medium: 6
        case .large: 12
        }
    }
    
    var hasLabel: Bool {
        return switch self {
        case .large: true
        default: false
        }
    }
}
