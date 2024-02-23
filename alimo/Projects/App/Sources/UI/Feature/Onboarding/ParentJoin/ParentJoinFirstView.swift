//
//  ParentJoinFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinFirstView: View {
    
    @StateObject var vm = ParentJoinViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("학생 코드를 입력해 주세요")
                        .font(.subtitle)
                        .foregroundStyle(Color.main900)
                        .padding(.leading, 24)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                SeparatedTextField(length: 6, string: $vm.childCode)
                    .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    Text("학생 코드가 무엇인가요?")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                        .padding(.trailing, 24)
                        .padding(.top, 8)
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
                .padding(.bottom, 16)
                
                let isCompleted: Bool = vm.childCode.count == 6
                let buttonType: AlimoButtonType = isCompleted ? .yellow : .none
                
                AlimoButton("다음", buttonType: buttonType, isLoading: vm.isFetching) {
                    Task {
                        await vm.verifyChildCode()
                    }
                }
                .disabled(!isCompleted)
                .padding(.bottom, 30)
                
                NavigationLink(isActive: $vm.isCorrectChildCode) {
                    ParentJoinSecondView(vm: vm, childName: vm.childName)
                } label: {}
            }
            .navigationBarBackButtonHidden()
            .alimoToolbar("회원가입") {
                dismiss()
            }
        }
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text(vm.dialogMessage),
                  dismissButton: .default(Text("닫기")))
        }
    }
}
