//
//  ParentJoinFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentJoinFirstView: View {
    
    @EnvironmentObject private var router: OnboardingRouter
    @StateObject var vm = ParentJoinViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var codeFocused: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Text("학생 코드를 입력해 주세요")
                .alimoFont(.headline1B)
                .alimoColor(AlimoColor.Label.normal)
                .padding(.leading, 4)
                .padding(.top, 16)
                .toLeading()
            SeparatedTextField(text: $vm.childCode, length: 6)
                .focused($codeFocused)
            Text("학생 코드가 무엇인가요?")
                .alimoFont(.labelM)
                .alimoColor(AlimoColor.Label.em)
                .onTapGesture {
                    router.navigateTo(.whatIsChildCode)
                }
                .padding(.trailing, 4)
                .toTrailing()
            Spacer()
            VStack(spacing: 16) {
                HStack(spacing: 4) {
                    Text("이미 계정이 있으시다면?")
                        .alimoFont(.captionM)
                        .alimoColor(AlimoColor.Label.em)
                    Text("로그인")
                        .alimoFont(.captionM)
                        .alimoColor(AlimoColor.Color.primary60)
                        .underline()
                        .onTapGesture {
                            router.navigateTo(.parentLoginFirst)
                        }
                }
                let isCompleted: Bool = vm.childCode.count == 6
                AlimoButton("다음", type: .CTA, isEnabled: isCompleted) {
                    await vm.verifyChildCode {
                        router.navigateTo(.parentJoinSecond(childName: vm.childName))
                    }
                }
                .disabled(!isCompleted)
                .padding(.bottom, ctaButtonPadding)
            }
        }
        .padding(.horizontal, 20)
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .alert(vm.dialogMessage, isPresented: $vm.showDialog) {
            Button("닫기") {}
        }
        .onAppear {
            codeFocused = true
        }
    }
}
