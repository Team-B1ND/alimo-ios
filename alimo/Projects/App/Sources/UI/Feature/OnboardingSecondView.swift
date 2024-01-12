//
//  OnboardingSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct OnboardingSecondView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    AlimoLogo(type: .yellow)
                    Text("대소고의 모든 소식")
                        .font(Font.subtitle)
                        .offset(x: 5, y: -10)
                }
                .padding(.trailing, 150)
                .padding(.bottom, 80)
                
                Image(Asset.screen)
                    .padding(.bottom, 100)
                
                NavigationLink {
                    OnboardingThirdView()
                } label: {
                    ZStack {
                        AlimoButton("시작하기", buttonType: .yellow) {}
                            .padding(.bottom, 30)
                            .disabled(true)
                    }
                }
            }
        }
    }
}
