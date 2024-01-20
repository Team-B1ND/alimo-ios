//
//  OnboardingFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct OnboardingFirstView: View {
    var body: some View {
        ZStack {
            Color.main500
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0) {
                AlimoLogo(type: .white)
                Text("대소고의 모든 소식")
                    .font(Font.body)
                    .foregroundStyle(Color.main900)
            }
        }
    }
}
