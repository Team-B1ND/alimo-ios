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
    
    @StateObject var vm = ParentJoinViewModel()
    @Environment(\.dismiss) private var dismiss
    @FocusState private var codeFocused: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("학생 코드를 입력해 주세요")
                        .alimoFont(.headline1B)
                        .alimoColor(AlimoColor.Label.normal)
                        .padding(.leading, 24)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                SeparatedTextField(text: $vm.childCode, length: 6)
                    .focused($codeFocused)
                    .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    NavigationLink {
                        WhatIsChildCodeView()
                    } label: {
                        Text("학생 코드가 무엇인가요?")
                            .alimoFont(.labelM)
                            .alimoColor(AlimoColor.Label.em)
                            .padding(.trailing, 24)
                            .padding(.top, 8)
                    }
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
                
                AlimoButton("다음", type: .CTA, isEnabled: isCompleted) {
                    await vm.verifyChildCode()
                }
                .padding(.horizontal, 20)
                .disabled(!isCompleted)
                .padding(.bottom, 30)
                
                NavigationLink(isActive: $vm.isCorrectChildCode) {
                    ParentJoinSecondView(childName: vm.childName)
                        .environmentObject(vm)
                } label: {}
            }
            .navigationBarBackButtonHidden()
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .alert(isPresented: $vm.showDialog) {
            Alert(title: Text(vm.dialogMessage),
                  dismissButton: .default(Text("닫기")))
        }
        .onAppear {
            codeFocused = true
        }
    }
}
