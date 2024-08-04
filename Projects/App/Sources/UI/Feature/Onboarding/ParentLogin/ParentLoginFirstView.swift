//
//  ParentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentLoginFirstView: View {
    
    @StateObject var vm = ParentLoginViewModel()
    @EnvironmentObject var tm: TokenManager
    @EnvironmentObject private var router: OnboardingRouter
    @Environment(\.dismiss) private var dismiss
    @FocusState private var emailFocused: Bool
    @FocusState private var pwFocused: Bool
    
    var body: some View {
        let isCompleted = vm.email != "" && vm.pw != ""
        let isCorrectPw = Regex.validatePassword(vm.pw)
        let isOk = isCompleted && isCorrectPw
        
        VStack(spacing: 16) {
            Text("학부모님 안녕하세요!")
                .alimoFont(.headline1B)
                .alimoColor(AlimoColor.Label.normal)
                .padding(.leading, 4)
                .padding(.top, 16)
                .toLeading()
            VStack(spacing: 8) {
                AlimoTextField("이메일을 입력하세요", text: $vm.email)
                    .focused($emailFocused)
                    .keyboardType(.emailAddress)
                    .onSubmit {
                        emailFocused = false
                        pwFocused = true
                    }
                AlimoTextField("비밀번호를 입력하세요", text: $vm.pw, isSecured: true)
                    .focused($pwFocused)
                Text("비밀번호 찾기")
                    .alimoFont(.labelM)
                    .alimoColor(AlimoColor.Label.em)
                    .onTapGesture {
                        router.navigateTo(.parentFindPWFirst)
                    }
                    .toTrailing()
                    .padding(.trailing, 4)
            }
            Spacer()
            HStack(spacing: 4) {
                Text("아직 계정이 없으시다면?")
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Label.em)
                Text("회원가입")
                    .alimoFont(.captionM)
                    .alimoColor(AlimoColor.Color.primary60)
                    .underline()
                    .onTapGesture {
                        router.navigateTo(.parentJoinFirst)
                    }
            }
            AlimoButton("로그인", type: .CTA, isEnabled: isOk) {
                await vm.signIn { accessToken, refreshToken in
                    tm.accessToken = accessToken
                    tm.refreshToken = refreshToken
                }
            }
            .disabled(!isOk)
            .padding(.bottom, ctaButtonPadding)
        }
        .padding(.horizontal, 20)
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("로그인", background: AlimoColor.Background.normal, backButtonAction: {
            dismiss()
        })
        .alert("아이디 또는 비밀번호가 잘못되었습니다", isPresented: $vm.showDialog) {
            Button("닫기") {}
        }
        .onAppear {
            emailFocused = true
        }
    }
}
