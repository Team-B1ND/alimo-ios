//
//  AlimoLogo.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI
import ADS

struct AlimoLogo: View {
    
    var type: AlimoLogoType
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(appName.uppercased())
                .alimoColor(AlimoColor.Label.normal)
//                .font(Font(AppFontFamily.Pretendard.bold.font(size: type.fontSize)))
            if type.hasDot {
                Circle()
                    .alimoColor(AlimoColor.Color.primary60)
                    .frame(width: 8, height: 8)
                    .padding(.bottom, 13)
            }
        }
    }
}

struct AlimoLogoBar: View {
    var body: some View {
        HStack {
            AlimoLogo(type: .gray)
                .padding(.leading, 16)
            Spacer()
        }
        .frame(height: 48)
    }
}
