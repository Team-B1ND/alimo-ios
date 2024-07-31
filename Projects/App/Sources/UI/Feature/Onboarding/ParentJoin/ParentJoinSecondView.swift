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
    @Environment(\.dismiss) private var dismiss
    @FocusState private var emailFocused: Bool
    @FocusState private var pwFocused: Bool
    @FocusState private var pwCheckFocused: Bool
    
    let childName: String?
    
    var body: some View {
        
        let isCompleted = !vm.email.isEmpty && !vm.pw.isEmpty && !vm.pwCheck.isEmpty
        let isSame: Bool = vm.pw == vm.pwCheck
        let isCorrectPw = Regex.validatePassword(vm.pw)
        
        VStack {
            HStack {
                Text("\(childName ?? "")\(childName != nil ? " " : "")학부모님 안녕하세요!")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("이메일을 입력해 주세요", text: $vm.email)
                .focused($emailFocused)
                .keyboardType(.emailAddress)
                .onSubmit {
                    pwFocused = true
                }
                .padding(.horizontal, 20)
            
            AlimoTextField("비밀번호를 입력해 주세요", text: $vm.pw, isSecured: true)
                .focused($pwFocused)
                .onSubmit {
                    pwCheckFocused = true
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
            
            AlimoTextField("비밀번호를 다시 입력해 주세요", text: $vm.pwCheck, isSecured: true)
                .focused($pwCheckFocused)
                .padding(.horizontal, 20)
            
            HStack {
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
                Spacer()
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            HStack {
                Text("이미 계정이 있으시다면?")
                    .font(.caption)
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentLoginFirstView()
                } label: {
                    Text("로그인")
                        .font(.caption)
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 16)
            
            let isOk = isCompleted && isSame && isCorrectPw
            
            NavigationLink(isActive: $vm.isCorrectSignUp) {
                ParentJoinThirdView()
                    .environmentObject(vm)
            } label: {}
            
            AlimoButton("다음", type: .CTA, isEnabled: (isCompleted && isSame && isOk)) {
                await vm.signUp()
            }
            .padding(.horizontal, 20)
            .disabled(!(isCompleted && isSame && isOk))
            .padding(.bottom, 30)
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .navigationBarBackButtonHidden()
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text(vm.dialogMessage),
                  dismissButton: .default(Text("닫기")))
        }
    }
}
