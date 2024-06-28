//
//  AlimoBadge.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct AlimoBadge: View {
    
    var type: AlimoBadgeType
    
    init(type: AlimoBadgeType = .large) {
        self.type = type
    }
    
    var body: some View {
        Circle()
            .foregroundStyle(Color.red500)
            .frame(width: type.width)
            .overlay {
                if type.hasLabel {
                    Text("N")
                        .foregroundStyle(Color.white)
                        .font(Font(AppFontFamily.Pretendard.medium.font(size: 8)))
                }
            }
    }
}
