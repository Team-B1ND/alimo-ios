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
    
//    @ObservedObject var vm = ParentLoginViewModel()
    @StateObject var vm = ParentLoginViewModel()
    @EnvironmentObject var tm: TokenManager
    @Environment(\.dismiss) private var dismiss
    @FocusState private var emailFocused: Bool
    @FocusState private var pwFocused: Bool
    
    var body: some View {
        let isCompleted = vm.email != "" && vm.pw != ""
        let isCorrectPw = Regex.validatePassword(vm.pw)
        let isOk = isCompleted && isCorrectPw
        
        VStack {
            HStack {
                Text("학부모님 안녕하세요!")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("이메일을 입력하세요", text: $vm.email)
                .padding(.horizontal, 20)
                .padding(.bottom, 8)
                .focused($emailFocused)
                .keyboardType(.emailAddress)
                .onSubmit {
                    emailFocused = false
                    pwFocused = true
                }
            
            AlimoTextField("비밀번호를 입력하세요", text: $vm.pw, isSecured: true)
                .padding(.horizontal, 20)
                .focused($pwFocused)

            HStack {
                Spacer()
                NavigationLink {
                    ParentFindPWFirstView()
                } label: {
                    Text("비밀번호 찾기")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                        .padding(.top, 4)
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            HStack {
                Text("아직 계정이 없으시다면?")
                    .font(.caption)
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentJoinFirstView()
                } label: {
                    Text("회원가입")
                        .font(.caption)
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 5)
            
            AlimoButton("로그인", type: .CTA, isEnabled: isOk) {
                await vm.signIn { accessToken, refreshToken in
                    tm.accessToken = accessToken
                    tm.refreshToken = refreshToken
                }
            }
            .padding(.horizontal, 20)
            .disabled(!isOk)
            .padding(.bottom, 30)
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("로그인", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .navigationBarBackButtonHidden(true)
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text("아이디 또는 비밀번호가 잘못되었습니다"),
                  dismissButton: .default(Text("닫기")))
        }
        .onAppear {
            emailFocused = true
        }
    }
}
