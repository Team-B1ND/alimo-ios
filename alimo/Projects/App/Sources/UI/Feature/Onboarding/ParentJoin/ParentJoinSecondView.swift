//
//  ParentJoinSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinSecondView: View {
    
    @ObservedObject var vm: ParentJoinViewModel
    
    @Environment(\.dismiss) private var dismiss
    
    @State var showTextAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("\(nil ?? "학부모")님 안녕하세요!")
                    .font(.subtitle)
                    .foregroundStyle(Color.main900)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("아이디", text: $vm.email)
            
            AlimoTextField("비밀번호", text: $vm.password, textFieldType: .password)
            
            AlimoTextField("비밀번호 재입력", text: $vm.pwCheck, textFieldType: .password)
            
            if showTextAlert {
                
                HStack {
                    Text("비밀번호가 다릅니다.")
                        .font(.caption)
                        .foregroundStyle(Color.red500)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
            }
            
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
            .padding(.bottom, 5)
            
            let isCompleted = !vm.email.isEmpty && !vm.password.isEmpty && !vm.pwCheck.isEmpty
            let isSame: Bool = vm.password == vm.pwCheck
            let isCorrectPw = Regex.validateInput(vm.password) && Regex.validateInput(vm.pwCheck)
            
            let isOk = isCompleted && isSame && isCorrectPw
            
            let buttonType: AlimoButtonType = isOk ? .yellow : .none
            
            NavigationLink(isActive: $vm.isCorrectSignUp) {
                ParentJoinThirdView(vm: vm)
            } label: {
            }
            
            AlimoButton("다음", buttonType: buttonType) {
                Task {
                    await vm.signUp()
                }
            }
            .disabled(!(isCompleted && isSame && isOk))
            .padding(.bottom, 30)
        }
        .onAppear() {
            showTextAlert = false
        }
        .navigationBarBackButtonHidden(true)
        .alimoToolbar("회원가입") {
            dismiss()
        }
    }
}
