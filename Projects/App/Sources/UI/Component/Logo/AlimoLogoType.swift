//
//  AlimoLogoType.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

enum AlimoLogoType {
    case white
    case yellow
    case gray
    
    var textColor: Color {
        return switch self {
        case .white: .black
        case .yellow: .black
        case .gray: .gray300
        }
    }
    
    var dotColor: Color {
        return switch self {
        case .white: .white
        case .yellow: .main500
        case .gray: .gray300
        }
    }
    
    var hasDot: Bool {
        return switch self {
        case .white: true
        case .yellow: true
        case .gray: false
        }
    }
    
    var fontSize: CGFloat {
        return switch self {
        case .white: 54
        case .yellow: 54
        case .gray: 20
        }
    }
}
