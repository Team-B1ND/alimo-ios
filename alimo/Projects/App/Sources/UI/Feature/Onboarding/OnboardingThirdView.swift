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
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("학생이신가요?")
                        .font(Font.subtitle)
                    Text("아니면 학부모이신가요?")
                        .font(Font.subtitle)
                }
                .padding(.trailing, 150)
                .padding(.vertical, 12)
                
                HStack {
                    Button {
                        isStudent = true
                    } label: {
                        if isStudent {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 160, height: 200)
                                .foregroundStyle(Color.gray100)
                                .overlay {
                                    Image(Asset.lightStudent)
                                    
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.main500, lineWidth: 2)
                                }
                            
                        } else {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 160, height: 200)
                                .foregroundStyle(Color.gray100)
                                .overlay {
                                    Image(Asset.darkStudent)
                                }
                        }
                    }
                    
                    Button {
                        isStudent = false
                    } label: {
                        if isStudent {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 160, height: 200)
                                .foregroundStyle(Color.gray100)
                                .overlay {
                                    Image(Asset.darkParent)
                                }
                            
                        } else {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 160, height: 200)
                                .foregroundStyle(Color.gray100)
                                .overlay {
                                    
                                    Image(Asset.lightParent)
                                    
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.main500, lineWidth: 2)
                                }
                            
                        }
                    }
                }
                
                Text("알리모에서는 학생, 학부모 모두 참여해요")
                    .font(.label)
                    .foregroundStyle(Color.gray500)
                    .padding(.vertical, 24)
                
                Spacer()
                
            }
            .padding(.bottom, 100)
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
            
            if isStudent {
                
                VStack {
                    
                    Spacer()
                    
                    NavigationLink {
                        StudentLoginFirstView()
                    } label: {
                        AlimoButton("도담도담으로 로그인", buttonType: .yellow) {
                            print(dummyText)
                        }
                        .padding(.bottom, 30)
                        .disabled(true)
                    }
                    
                }
                
            } else {
                VStack(spacing: 16) {
                    
                    Spacer()
                    
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
                    
                    NavigationLink {
                        ParentJoinFirstView()
                    } label: {
                        AlimoButton("회원가입", buttonType: .yellow) {
                            print(dummyText)
                        }
                        .padding(.bottom, 30)
                        .disabled(true)
                    }
                }
                
            }
        }
        
    }
}
