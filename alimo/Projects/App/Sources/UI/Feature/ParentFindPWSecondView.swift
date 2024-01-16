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
    
    // 비밀번호랑 비밀번호 재확인에 입력한 문자열이 같은 지 확인하는 함수
    func isPwcheckSame(pw: String, pwCheck: String) -> Bool {
        
        if pw == pwCheck {
            return true
        } else {
            return false
        }
        
    }
    
    var body: some View {
        VStack {
            Text("새 비밀번호를 만들어 주세요")
                .font(Font.subtitle)
                .foregroundStyle(Color.main900)
                .padding(.trailing, 120)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            AlimoTextField("새 비밀번호", text: $pw, textFieldType: .password)
            
            AlimoTextField("새 비밀번호 재입력", text: $pwCheck, textFieldType: .password)
            
            if showTextAlert {
                
                HStack {
                    Text("비밀번호가 다릅니다.")
                        .font(Font.caption)
                        .foregroundStyle(Color.red500)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
            }
            
            Spacer()
            
            if pw != "" && pwCheck != "" {
                
                if pw == pwCheck {
                    
                    NavigationLink {
                        // 홈 뷰
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
                AlimoButton("완료", buttonType: .none) {
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
                    
                    Text("비밀번호 찾기")
                        .font(Font.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}
