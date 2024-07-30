//
//  OnboardingThirdView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct OnboardingSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isSelected: RoleType = .Student
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Text("해당하는 곳을 선택해 주세요")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .toLeading()
                    .padding(.horizontal, 20)
                
                SegmentedButton(buttonType: [.Student, .Parent, .Teacher], isSelected: $isSelected)
                
                Text("알리모에서는 학생, 학부모, 선생님 모두 참여해요")
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Label.em)
            }
            .padding(.bottom, 100)
            .navigationBarBackButtonHidden()
            
            VStack(spacing: 16) {
                Spacer()
                let loginButtonText = isSelected == .Parent ? "로그인" : "도담도담으로 로그인"
                NavigationLink {
                    if isSelected == .Parent {
                        ParentLoginFirstView()
                    } else {
                        StudentLoginFirstView()
                    }
                } label: {
                    AlimoButton(loginButtonText, buttonType: .yellow) {
                        // 학생인지 아닌지에 따라 다르게 핸들링
                    }
                    .padding(.bottom, 30)
                    .disabled(true)
                }
            }
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("", background: AlimoColor.Background.normal) {
            dismiss()
        }
    }
}
