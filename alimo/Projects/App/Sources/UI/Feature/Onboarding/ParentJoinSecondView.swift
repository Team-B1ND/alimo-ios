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
    
    // 비밀번호랑 비밀번호 재확인에 입력한 문자열이 같은 지 확인하는 함수
    func isPwcheckSame(pw: String, pwCheck: String) -> Bool {
        
        if pw == pwCheck {
            return true
        } else {
            return false
        }
        
    }
    
    // 이메일, 비밀번호, 비밀번호 재확인에 문자열을 입력했는지 확인하는 함수
    func isAllEntered(_ email: String, _ pw: String, _ pwCheck: String) -> Bool {
        
        if email != "" && pw != "" && pwCheck != "" {
            return true
        } else {
            return false
        }
        
    }
    
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
                    .font(.custom(Pretendard.medium.rawValue, size: 12))
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentLoginFirstView()
                } label: {
                    Text("로그인")
                        .font(.custom(Pretendard.medium.rawValue, size: 12))
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 5)
            
            if isAllEntered(email, pw, pwCheck) {
                
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
