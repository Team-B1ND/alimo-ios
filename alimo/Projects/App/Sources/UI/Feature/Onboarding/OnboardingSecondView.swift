//
//  OnboardingThirdView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct OnboardingSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isStudent: Bool = true
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("학생이신가요?")
                            .font(Font.subtitle)
                        Text("아니면 학부모이신가요?")
                            .font(Font.subtitle)
                    }
                    .padding(.leading, 24)
                    Spacer()
                }
                .padding(.bottom, 12)
                
                HStack(spacing: 8) {
                    Button { // 이 버튼들도 컴포넌트로 빼면 좋음
                        isStudent = true
                    } label: {
                        let studentImage = isStudent ? Asset.lightStudent : Asset.darkStudent
                        
                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .foregroundStyle(Color.gray100)
                            .overlay {
                                Image(studentImage)
                                if isStudent {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.main500, lineWidth: 2)
                                }
                            }
                    }
                    Button {
                        isStudent = false
                    } label: {
                        let parentImage = !isStudent ? Asset.lightParent : Asset.darkParent
                        RoundedRectangle(cornerRadius: 12)
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .foregroundStyle(Color.gray100)
                            .overlay {
                                Image(parentImage)
                                if !isStudent {
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.main500, lineWidth: 2)
                                }
                            }
                        
                    }
                }
                .padding(.horizontal, 16)
                
                Text("알리모에서는 학생, 학부모 모두 참여해요")
                    .font(.label)
                    .foregroundStyle(Color.gray500)
                    .padding(.top, 24)
                
                Spacer()
            }
            .padding(.bottom, 100)
            .navigationBarBackButtonHidden()
            
            VStack(spacing: 16) {
                
                Spacer()
                if !isStudent {
                    HStack {
                        Text("이미 계정이 있으시다면?")
                            .font(.label)
                            .foregroundStyle(Color.gray500)
                        
                        NavigationLink {
                            ParentLoginFirstView()
                        } label: {
                            Text("로그인")
                                .font(.label)
                                .foregroundStyle(Color.main500)
                                .underline()
                        }
                    }
                }
                let loginButtonText = isStudent ? "도담도담으로 로그인" : "회원가입"
                
                NavigationLink {
                    if isStudent {
                        StudentLoginFirstView()
                    } else {
                        ParentJoinFirstView()
                    }
                } label: {
                    AlimoButton(loginButtonText, buttonType: .yellow) {
                        // 학생인지 아닌지에 따라 다르게 핸들링
                    }
                    .padding(.bottom, 30)
                    .disabled(true)
                }
            }
        }
        .alimoToolbar("") {
            dismiss()
        }
    }
}
