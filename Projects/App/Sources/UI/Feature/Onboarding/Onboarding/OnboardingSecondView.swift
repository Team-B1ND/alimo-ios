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
        VStack(spacing: 0) {
            Spacer()
            VStack(spacing: 16) {
                Text("해당하는 곳을 선택해 주세요")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .toLeading()
                    .padding(.leading, 4)
                SegmentedButton(buttonType: [.Student, .Parent, .Teacher], isSelected: $isSelected)
                Text("알리모에서는 학생, 학부모, 선생님 모두 참여해요")
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Label.em)
            }
            Spacer()
            let loginButtonText = isSelected == .Parent ? "로그인" : "도담도담으로 로그인"
            NavigationLink {
                if isSelected == .Parent {
                    ParentLoginFirstView()
                } else {
                    StudentLoginFirstView()
                }
            } label: {
                AlimoButton(loginButtonText, type: .CTA) {
                    // 학생인지 아닌지에 따라 다르게 핸들링
                }
                .disabled(true)
            }
            .padding(.bottom, ctaButtonPadding)
        }
        .padding(.horizontal, 20)
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
    }
}
