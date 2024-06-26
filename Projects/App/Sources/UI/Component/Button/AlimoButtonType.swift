//
//  AlimoButtonType.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

enum AlimoButtonType {
    case yellow
    case black
    case red
    case none
    
    var backgroundColor: Color {
        get {
            switch self {
            case .yellow:
                return .main500
            case .black:
                return .main900
            case .red:
                return .red200
            case .none:
                return .gray100
            }
        }
    }
    
    var foregroundColor: Color {
        get {
            switch self {
            case .yellow:
                return .black
            case .black:
                return .white
            case .red:
                return .red500
            case .none:
                return .gray500
            }
        }
    }
}

