//
//  StudentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct StudentLoginFirstView: View {
    
    @StateObject var vm = StudentLoginViewModel()
    @EnvironmentObject var tm: TokenManager
    @Environment(\.dismiss) private var dismiss
    @FocusState private var idFocused: Bool
    @FocusState private var pwFocused: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            Text("도담도담 계정으로 시작하세요!")
                .alimoFont(.headline1B)
                .alimoColor(AlimoColor.Label.normal)
                .padding(.leading, 4)
                .toLeading()
                .padding(.top, 16)
            VStack(spacing: 8) {
                AlimoTextField("아이디를 입력하세요", text: $vm.id)
                    .focused($idFocused)
                    .onSubmit {
                        idFocused = false
                        pwFocused = true
                    }
                AlimoTextField("비밀번호를 입력하세요", text: $vm.pw, isSecured: true)
                    .focused($pwFocused)
            }
            Spacer()
            let isComplete = vm.id != "" && vm.pw != ""
            let buttonText = vm.isFetching ? "" : "로그인"
            AlimoButton(buttonText, type: .CTA, isEnabled: isComplete) {
                await vm.signIn { accessToken, refreshToken in
                    tm.accessToken = accessToken
                    tm.refreshToken = refreshToken
                }
            }
            .disabled(!isComplete)
            .padding(.bottom, ctaButtonPadding)
        }
        .padding(.horizontal, 20)
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("로그인", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .onTapGesture {
            endTextEditing()
        }
        .alert("로그인 할 수 없습니다", isPresented: $vm.showError) {
            Button("확인") {}
        } message: {
            Text("아이디 비밀번호를 다시 확인해 주세요")
        }
        .onAppear {
            idFocused = true
        }
    }
}
