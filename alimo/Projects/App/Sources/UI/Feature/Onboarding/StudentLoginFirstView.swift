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
            Text("도담도담 계정으로 로그인해주세요!")
                .font(.subtitle)
                .padding(.trailing, 80)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
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
