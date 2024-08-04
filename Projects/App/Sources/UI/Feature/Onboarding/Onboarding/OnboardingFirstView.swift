//
//  OnboardingSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct OnboardingFirstView: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack(alignment: .bottom) {
                            Image(image: .MiniLogo)
                                .resizable()
                                .frame(width: 167, height: 40)
                            Circle()
                                .alimoColor(AlimoColor.Color.primary60)
                                .frame(width: 8, height: 8)
                                .offset(x: -8)
                        }
                        Text("대소고의 모든 소식")
                            .alimoFont(.headline1B)
                            .alimoColor(AlimoColor.Label.normal)
                    }
                    Spacer()
                }
                .padding(.leading, 20)
                Image(.screen)
            }
            NavigationLink {
                OnboardingSecondView()
            } label: {
                AlimoButton("시작하기", type: .CTA) {}
                    .disabled(true)
            }
            .padding(.bottom, ctaButtonPadding)
            .padding(.horizontal, 20)
            .toBottom()
        }
        .alimoBackground(AlimoColor.Background.normal)
    }
}
