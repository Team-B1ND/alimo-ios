//
//  ParentJoinSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentJoinSecondView: View {
    
    @EnvironmentObject var vm: ParentJoinViewModel
    @EnvironmentObject private var router: OnboardingRouter
    @Environment(\.dismiss) private var dismiss
    @FocusState private var emailFocused: Bool
    @FocusState private var pwFocused: Bool
    @FocusState private var pwCheckFocused: Bool
    
    let childName: String?
    
    var body: some View {
        
        let isCompleted = !vm.email.isEmpty && !vm.pw.isEmpty && !vm.pwCheck.isEmpty
        let isSame: Bool = vm.pw == vm.pwCheck
        let isCorrectPw = Regex.validatePassword(vm.pw)
        
        VStack(spacing: 16) {
            Text("\(childName ?? "")\(childName != nil ? " " : "")학부모님 안녕하세요!")
                .alimoFont(.headline1B)
                .alimoColor(AlimoColor.Label.normal)
                .padding(.top, 16)
                .padding(.leading, 4)
                .toLeading()
            VStack(spacing: 8) {
                AlimoTextField("이메일을 입력해 주세요", text: $vm.email)
                    .focused($emailFocused)
                    .keyboardType(.emailAddress)
                    .onSubmit {
                        pwFocused = true
                    }
                AlimoTextField("비밀번호를 입력해 주세요", text: $vm.pw, isSecured: true)
                    .focused($pwFocused)
                    .onSubmit {
                        pwCheckFocused = true
                    }
                AlimoTextField("비밀번호를 다시 입력해 주세요", text: $vm.pwCheck, isSecured: true)
                    .focused($pwCheckFocused)
            }
            Group {
                if !isCorrectPw && !vm.pw.isEmpty {
                    Text("5~18자 영문, 숫자, 특수문자")
                } else if vm.pw != vm.pwCheck && !vm.pwCheck.isEmpty {
                    Text("비밀번호가 일치하지 않습니다")
                }
            }
            .alimoFont(.captionM)
            .padding(.top, 4)
            .alimoColor(AlimoColor.Warning.normal)
            .toLeading()
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
                let isOk = isCompleted && isSame && isCorrectPw
                AlimoButton("다음", type: .CTA, isEnabled: isOk) {
                    await vm.signUp {
                        router.navigateTo(.parentJoinThird)
                    }
                }
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
    }
}
