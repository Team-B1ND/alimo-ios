//
//  ParentJoinSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var email: String = ""
    @State var pw: String = ""
    @State var pwCheck: String = ""
    
    @State var showTextAlert: Bool = false
    
    let dummyStudentName: String = "김가영"
    
    var body: some View {
        VStack {
            Text("\(dummyStudentName) 학부모님 안녕하세요!")
                .font(.subtitle)
                .foregroundStyle(Color.main900)
                .padding(.trailing, 120)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            AlimoTextField("이메일", text: $email)
            
            AlimoTextField("비밀번호", text: $pw, textFieldType: .password)
            
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
            
            if email != "" && pw != "" && pwCheck != "" {
                
                if pw == pwCheck {
                    
                    NavigationLink {
                        ParentJoinThirdView()
                    } label: {
                        AlimoButton("다음", buttonType: .yellow) {}
                        .disabled(true)
                        .padding(.bottom, 30)
                    }
                    
                } else {
                    
                    AlimoButton("다음", buttonType: .yellow) {
                        showTextAlert = true
                    }
                    .padding(.bottom, 30)
                    
                }
                
            } else {
                AlimoButton("다음", buttonType: .none) {}
                .disabled(true)
                .padding(.bottom, 30)
            }
            
        }
        .onAppear() {
            showTextAlert = false
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                    
                    Text("회원가입")
                        .font(.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}
