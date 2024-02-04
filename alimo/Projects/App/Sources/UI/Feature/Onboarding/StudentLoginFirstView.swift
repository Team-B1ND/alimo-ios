//
//  StudentLoginFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct StudentLoginFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var id: String = ""
    @State var pw: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("도담도담 계정으로 로그인해주세요!")
                    .font(.subtitle)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            AlimoTextField("아이디를 입력하세요", text: $id)
            AlimoTextField("비밀번호를 입력하세요", text: $pw, textFieldType: .password)
            
            Spacer()
            
            if id != "" && pw != "" {
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
        .alimoToolbar("로그인") {
            dismiss()
        }
    }
}
