//
//  ParentFindPWFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentFindPWFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var dummyAuthNumber: String = ""
    
    var body: some View {
        VStack {
            Text("이메일 인증 코드를 전송했어요")
                .font(Font.subtitle)
                .foregroundStyle(Color.main900)
                .padding(.trailing, 100)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            ZStack {
                AlimoTextField("인증 코드", text: $dummyAuthNumber)
            }
            
            Spacer()
            
            if dummyAuthNumber != "" {
                NavigationLink {
                    ParentFindPWSecondView()
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
