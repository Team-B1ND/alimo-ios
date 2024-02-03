//
//  Color.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

extension Color {
    
    // main color
    static public let main50 = Color(0xFFFEFC)
    static public let main100 = Color(0xFDF2CD)
    static public let main200 = Color(0xFBE69E)
    static public let main300 = Color(0xFADB70)
    static public let main400 = Color(0xFBD757)
    static public let main500 = Color(0xFECE23)
    static public let main600 = Color(0xD2A70E)
    static public let main700 = Color(0x7C630A)
    static public let main800 = Color(0x534307)
    static public let main900 = Color(0x020202)
    
    // gray color
    static public let gray100 = Color(0xF4F5F9)
    static public let gray300 = Color(0xE6E6E6)
    static public let gray400 = Color(0xD1D1D1)
    static public let gray500 = Color(0xAAAAAA)
    static public let gray600 = Color(0x787878)
    static public let gray700 = Color(0x333333)
    
    // red color
    static public let red200 = Color(0xFFE8E8)
    static public let red500 = Color(0xF90707)
    
}

extension Color {
    
    // hex to color
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
