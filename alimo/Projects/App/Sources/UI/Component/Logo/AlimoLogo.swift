//
//  AlimoLogo.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct AlimoLogo: View {
    
    var type: AlimoLogoType
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            Text(appName.uppercased())
                .foregroundStyle(type.textColor)
                .font(Font(AppFontFamily.Pretendard.bold.font(size: type.fontSize)))
            if type.hasDot {
                Circle()
                    .foregroundStyle(type.dotColor)
                    .frame(width: 8, height: 8)
                    .padding(.bottom, 13)
            }
        }
    }
}
