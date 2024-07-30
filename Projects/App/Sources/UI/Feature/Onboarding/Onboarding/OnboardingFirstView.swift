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
    
    @State var showEasterEgg: Bool = false
    
    @EnvironmentObject private var colorProvider: ColorProvider
    
    var body: some View {
        NavigationStack {
            GeometryReader { reader in
                ZStack {
                    VStack(spacing: 0) {
                        Spacer()
                        HStack {
                            VStack(alignment: .leading, spacing: 0) {
                                AlimoLogo(type: .yellow)
                                Text("대소고의 모든 소식")
                                    .alimoFont(.headline1B)
                                    .alimoColor(AlimoColor.Label.normal)
                                    .offset(x: 3, y: -5)
                            }
                            Spacer()
                        }
                        .padding(.leading, 24)
                        .padding(.bottom, 30)
                        // 스낵바 테스트해 보고 싶어서 이미지를 버튼으로 만들어 놨어요
                        Button {
                            showEasterEgg = true
                        } label: {
                            Image(.screen)
                        }
                        .padding(.bottom, reader.size.height / 800 * 123)
                        NavigationLink {
                            OnboardingSecondView()
                        } label: {
                            AlimoButton("시작하기", buttonType: .yellow) {}
                                .padding(.bottom, 30)
                                .disabled(true)
                        }
                    }
                    .alert(isPresented: $showEasterEgg) {
                        Alert(title: Text("히히 이걸 찾아니"),
                              message: Text("대단하시네요"),
                              dismissButton: .default(Text("닫기")))
                    }
                }
                .alimoBackground(AlimoColor.Background.normal)
            }
        }
    }
}
