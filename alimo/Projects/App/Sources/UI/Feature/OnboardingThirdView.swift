//
//  OnboardingThirdView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct OnboardingThirdView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isStudent: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("학생이신가요?")
                    .font(Font.subtitle)
                Text("아니면 학부모이신가요?")
                    .font(Font.subtitle)
            }
            .padding(.trailing, 150)
            
            HStack {
                Button {
                    isStudent = true
                } label: {
                    if isStudent {
                        Image(Asset.lightStudent)
                            .frame(width: 160, height: 200)
                            .background(Color.gray100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.main500, lineWidth: 2)
                            }
                    } else {
                        Image(Asset.darkStudent)
                            .frame(width: 160, height: 200)
                            .background(Color.gray100)
                    }
                }
                
                Button {
                    isStudent = false
                } label: {
                    if isStudent {
                        Image(Asset.darkParent)
                            .frame(width: 160, height: 200)
                            .background(Color.gray100)
                    } else {
                        Image(Asset.lightParent)
                            .frame(width: 160, height: 200)
                            .background(Color.gray100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.main500, lineWidth: 2)
                            }
                    }
                }
            }
            
            Text("알리모에서는 학생, 학부모 모두 참여해요")
                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                .foregroundStyle(Color.gray500)
                .padding(.top, 10)
            
            Spacer()
            
            if isStudent {
                Rectangle()
                    .frame(width: 150, height: 19)
                    .foregroundStyle(Color.main50)
                
                NavigationLink {
                    StudentLoginFirstView()
                } label: {
                    AlimoButton("도담도담으로 로그인", buttonType: .yellow) {
                        print(dummyText)
                    }
                    .padding(.bottom, 30)
                    .disabled(true)
                }
                
            } else {
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
                
                NavigationLink {
                    ParentJoinFirstView()
                } label: {
                    AlimoButton("회원가입", buttonType: .yellow) {
                        print(dummyText)
                    }
                    .disabled(true)
                    .padding(.bottom, 30)
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}
