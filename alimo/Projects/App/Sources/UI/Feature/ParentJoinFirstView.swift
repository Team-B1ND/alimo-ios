//
//  ParentJoinFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var code: String = ""
    
    var body: some View {
        VStack {
            Text("학생 코드를 입력해 주세요")
                .font(Font.subtitle)
                .foregroundStyle(Color.main900)
                .padding(.trailing, 140)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            AlimoTextField("임시 텍스트 필드", text: $code)
            
            Text("학생 코드가 무엇인가요?")
                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                .foregroundStyle(Color.gray500)
                .padding(.leading, 240)
                .padding(.top, 5)
            
            Spacer()
            
            HStack {
                Text("이미 계정이 있으시다면?")
                    .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentLoginFirstView()
                } label: {
                    Text("로그인")
                        .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 5)
            
            if code != "" {
                NavigationLink {
                    ParentJoinSecondView()
                } label: {
                    AlimoButton("다음", buttonType: .yellow) {
                        print(dummyText)
                    }
                    .disabled(true)
                    .padding(.bottom, 30)
                }
            } else {
                AlimoButton("다음", buttonType: .none) {
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
                    
                    Text("회원가입")
                        .font(Font.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}
