//
//  ParentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentLoginFirstView: View {
    
    @ObservedObject var vm = ParentLoginViewModel()
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
                    .font(.subtitle)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("이메일을 입력하세요", text: $vm.email)
                .focused($emailFocused)
                .keyboardType(.emailAddress)
                .onSubmit {
                    emailFocused = false
                    pwFocused = true
                }
            
            AlimoTextField("비밀번호를 입력하세요", text: $vm.pw, type: .password)
                .focused($pwFocused)
            
            HStack {
                if !isCorrectPw && !vm.pw.isEmpty {
                    Text("5~18자 영문, 숫자, 특수문자")
                        .font(.caption)
                        .padding(.top, 4)
                        .foregroundStyle(Color.red500)
                }
                Spacer()
//                NavigationLink {
//                    ParentFindPWFirstView()
//                } label: {
//                    Text("비밀번호 찾기")
//                        .font(.caption)
//                        .foregroundStyle(Color.gray500)
//                        .padding(.top, 4)
//                }
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
            
            
            let buttonType: AlimoButtonType = isOk ? .yellow : .none
            
            AlimoButton("로그인", buttonType: buttonType, isLoading: vm.isFetching) {
                Task {
                    await vm.signIn { accessToken, refreshToken in
                        tm.accessToken = accessToken
                        tm.refreshToken = refreshToken
                    }
                }
            }
            .disabled(!isOk)
            .padding(.bottom, 30)
        }
        .navigationBarBackButtonHidden(true)
        .alimoToolbar("로그인") {
            NavigationUtil.popToRootView()
        }
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text("아이디 또는 비밀번호가 잘못되었습니다"),
                  dismissButton: .default(Text("닫기")))
        }
        .onAppear {
            emailFocused = true
        }
    }
}
