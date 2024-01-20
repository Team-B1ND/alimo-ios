//
//  ParentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentLoginFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var dummyEmail: String = ""
    @State var dummyPw: String = ""
    
    var body: some View {
        VStack {
            Text("학부모님 안녕하세요!")
                .font(.subtitle)
                .padding(.trailing, 180)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            AlimoTextField("아이디를 입력하세요", text: $dummyEmail)
            
            AlimoTextField("비밀번호를 입력하세요", text: $dummyPw, textFieldType: .password)
            
            NavigationLink {
                ParentFindPWFirstView()
            } label: {
                Text("비밀번호 찾기")
                    .font(.custom(Pretendard.medium.rawValue, size: 12))
                    .foregroundStyle(Color.gray500)
                    .padding(.leading, 280)
                    .padding(.top, 5)
            }
            
            Spacer()
            
            HStack {
                Text("아직 계정이 없으시다면?")
                    .font(.custom(Pretendard.medium.rawValue, size: 12))
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentJoinFirstView()
                } label: {
                    Text("회원가입")
                        .font(.custom(Pretendard.medium.rawValue, size: 12))
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 5)
            
            if dummyEmail != "" && dummyPw != "" {
                NavigationLink {
                    // 홈 뷰
                } label: {
                    AlimoButton("로그인", buttonType: .yellow) {
                        print(dummyText)
                    }
                    .disabled(true)
                    .padding(.bottom, 30)
                }
            } else {
                AlimoButton("로그인", buttonType: .none) {
                    print(dummyText)
                }
                .disabled(true)
                .padding(.bottom, 30)
            }
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
                    
                    Text("로그인")
                        .font(.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}
