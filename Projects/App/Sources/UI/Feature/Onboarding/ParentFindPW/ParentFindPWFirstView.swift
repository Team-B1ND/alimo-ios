//
//  ParentFindPWFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentFindPWFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var router: OnboardingRouter
    @StateObject var vm: ParentFindPWViewModel = ParentFindPWViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("계정의 이메일을 알려주세요")
                .alimoFont(.headline1B)
                .alimoColor(AlimoColor.Label.normal)
                .padding(.top, 16)
                .toLeading()
                .padding(.leading, 4)
            AlimoTextField("이메일을 입력해 주세요", text: $vm.email)
            Spacer()
            AlimoButton("다음", type: .CTA, isEnabled: !vm.email.isEmpty) {
                router.navigateTo(.parentFindPWSecond)
            }
            .padding(.bottom, ctaButtonPadding)
        }
        .padding(.horizontal, 20)
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
    }
}
