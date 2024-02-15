//
//  ParentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentLoginFirstView: View {
    
    @ObservedObject var parentLoginViewModel = ParentLoginViewModel()
    
    @EnvironmentObject var tm: TokenManager
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text("학부모님 안녕하세요!")
                    .font(.subtitle)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("아이디를 입력하세요", text: $parentLoginViewModel.email)
            
            AlimoTextField("비밀번호를 입력하세요", text: $parentLoginViewModel.pw, textFieldType: .password)
            
            NavigationLink {
                ParentFindPWFirstView()
            } label: {
                HStack {
                    Spacer()
                    Text("비밀번호 찾기")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                        .padding(.top, 5)
                        .padding(.trailing, 24)
                }
            }
            
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
            
            if parentLoginViewModel.email != "" && parentLoginViewModel.pw != "" {
                AlimoButton("로그인", buttonType: .yellow) {
                    
                    Task {
                        await parentLoginViewModel.signIn {
                            tm.accessToken = $0
                            tm.refreshToken = $1
                        }
                    }
                    
                }
                .disabled(true)
                .padding(.bottom, 30)
            } else {
                AlimoButton("로그인", buttonType: .none) {
                    print(dummyText)
                }
                .disabled(true)
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
        .alimoToolbar("로그인") {
            dismiss()
        }
    }
}
