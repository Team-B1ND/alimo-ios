//
//  StudentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct StudentLoginFirstView: View {
    
    @ObservedObject var vm = StudentLoginViewModel()
    @EnvironmentObject var tm: TokenManager
    @Environment(\.dismiss) private var dismiss
    @FocusState private var idFocused: Bool
    @FocusState private var pwFocused: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Text("도담도담 계정으로 로그인해주세요!")
                .font(.subtitle)
                .padding(.leading, 24)
                .padding(.top, 30)
                .padding(.bottom, 10)
                .toLeading()
            AlimoTextField("아이디를 입력하세요", text: $vm.id)
                .focused($idFocused)
                .onSubmit {
                    idFocused = false
                    pwFocused = true
                }
            AlimoTextField("비밀번호를 입력하세요", text: $vm.pw, type: .password)
                .focused($pwFocused)
            Spacer()
            
            let isComplete = vm.id != "" && vm.pw != ""
            let buttonType: AlimoButtonType = isComplete ? .yellow : .none
            let buttonText = vm.isFetching ? "" : "로그인"
            AlimoButton(buttonText, buttonType: buttonType, isLoading: vm.isFetching) {
                Task {
                    await vm.signIn { accessToken, refreshToken in
                        tm.accessToken = accessToken
                        tm.refreshToken = refreshToken
                    }
                }
            }
            .disabled(!isComplete)
            .padding(.bottom, 30)
        }
        .onTapGesture {
            endTextEditing()
        }
        .navigationBarBackButtonHidden()
        .alimoToolbar("로그인") {
            NavigationUtil.popToRootView()
        }
        .alert(isPresented: $vm.showError) {
            Alert(title: Text("로그인 할 수 없습니다"),
                  message: Text("아이디 비밀번호를 다시 확인해 주세요"),
                  dismissButton: .default(Text("확인")))
        }
        .onAppear {
            idFocused = true
        }
    }
}
