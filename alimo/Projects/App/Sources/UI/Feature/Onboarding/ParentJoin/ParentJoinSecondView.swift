//
//  ParentJoinSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinSecondView: View {
    
    @ObservedObject var vm = ParentJoinViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    @State var pwCheck: String = ""
    
    @State var showTextAlert: Bool = false
    
    @State var name: String? = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("\(vm.memberInfo?.name ?? "")님 안녕하세요!")
                    .font(.subtitle)
                    .foregroundStyle(Color.main900)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("이메일", text: $vm.email)
            
            AlimoTextField("비밀번호", text: $vm.password, textFieldType: .password)
            
            AlimoTextField("비밀번호 재입력", text: $pwCheck, textFieldType: .password)
            
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
            
            let isCompleted = !vm.email.isEmpty && !vm.password.isEmpty && !pwCheck.isEmpty
            let isSame = vm.password == pwCheck
            
            let buttonType: AlimoButtonType = isCompleted ? .yellow : .none
            
            NavigationLink {
                ParentJoinThirdView()
            } label: {
                AlimoButton("다음", buttonType: buttonType) {
                    showTextAlert = true
                }
                .disabled(isCompleted && isSame)
                .padding(.bottom, 30)
            }
        }
        .task {
            await vm.getInfo()
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
