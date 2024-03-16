//
//  ParentFindPWSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentFindPWSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var pw: String = ""
    @State var pwCheck: String = ""
    
    @State var showTextAlert: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text("새 비밀번호를 만들어 주세요")
                    .font(.subtitle)
                    .foregroundStyle(Color.main900)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            AlimoTextField("새 비밀번호", text: $pw, textFieldType: .password)
            AlimoTextField("새 비밀번호 재입력", text: $pwCheck, textFieldType: .password)
            
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
            
            let isCompleted = !pw.isEmpty
            let isSame = pw == pwCheck
            let buttonType: AlimoButtonType = isCompleted ? .yellow : .none
            
            NavigationLink {
                
            } label: {
                AlimoButton("완료", buttonType: buttonType) {
                    showTextAlert = true
                }
                .disabled(isCompleted && isSame)
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
        .alimoToolbar("비밀번호 찾기") {
            dismiss()
        }
    }
}
