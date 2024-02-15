//
//  OnboardingSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct OnboardingFirstView: View {
    
    @State var isClicked: Bool = false
    @State var isAnimating: Bool = false
    
    @ViewBuilder
    var snackBar: some View {
        VStack {
            Spacer()
            
            RoundedCorner(radius: 4)
                .frame(height: 50)
                .foregroundStyle(.white)
                .shadow(radius: 4)
                .overlay {
                    HStack {
                        
                        Text("세션이 만료되었어요")
                            .font(.body)
                        Spacer()
                        Button {
                            isClicked = false
                            isAnimating = false
                        } label: {
                            Text("닫기")
                                .font(.bodyLight)
                                .foregroundStyle(Color.yellow)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                .offset(y : isAnimating ? 0 : 100)
                .animation(.bouncy(duration: 0.5), value: isAnimating)
            
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            AlimoLogo(type: .yellow)
                            Text("대소고의 모든 소식")
                                .font(.subtitle)
                                .offset(x: 3, y: -5)
                        }
                        Spacer()
                    }
                    .padding(.leading, 24)
                    .padding(.bottom, 72)
                    // 스낵바 테스트해 보고 싶어서 이미지를 버튼으로 만들어 놨어요
                    Button {
                        isClicked = true
                        isAnimating = true
                    } label: {
                        Image(Asset.screen)
                    }
                    Spacer()
                    NavigationLink {
                        OnboardingSecondView()
                    } label: {
                        AlimoButton("시작하기", buttonType: .yellow) {}
                            .padding(.bottom, 30)
                            .disabled(true)
                    }
                }
                snackBar
            }
        }
    }
}
