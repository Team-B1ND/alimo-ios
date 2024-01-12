//
//  ProfileView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @State var someToggle: Bool = true
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(Color.gray100)
                        .padding(.top, 40)
                    
                    Text("김가영")
                        .font(Font.body)
                        .padding(.top, 10)
                    
                    Text("학생코드")
                        .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                        .foregroundStyle(Color.gray500)
                        .underline()
                    
                    HStack {
                        ForEach(1...3, id: \.self) { _ in
                            Text("사운드체크")
                                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                                .foregroundStyle(Color.gray500)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(Color.gray100)
                                .clipShape(Capsule())
                        }
                        
                    }
                    .padding(.top, 10)
                    
                    Toggle("알림 설정", isOn: $someToggle)
                        .tint(Color.main500)
                        .frame(height: 60)
                        .background(Color.main50)
                        .padding(.horizontal, 20)
                }
                .background(Color.main50)
                
                Color.gray100
                    .frame(height: 10)
                
                VStack(alignment: .leading, spacing: 20) {
                    NavigationLink {
                        // 개인정보 이용 약관 뷰
                    } label: {
                        Text("개인정보 이용 약관")
                            .font(Font.bodyLight)
                            .foregroundStyle(.black)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink {
                        // 서비스 정책
                    } label: {
                        Text("서비스 정책")
                            .font(Font.bodyLight)
                            .foregroundStyle(.black)
                            .padding(.top, 20)
                    }
                    
                    HStack {
                        Text("버전")
                            .font(Font.bodyLight)
                            .foregroundStyle(.black)
                        Spacer()
                        Text("v1.0.0")
                            .font(Font.custom(Pretendard.medium.rawValue, size: 16))
                            .foregroundStyle(Color.gray500)
                    }
                    .padding(.top, 20)
                    
                    Divider()
                    
                    Button {
                        // 로그아웃
                    } label: {
                        Text("로그아웃")
                            .font(Font.custom(Pretendard.medium.rawValue, size: 16))
                            .foregroundStyle(Color.red500)
                            .padding(.bottom, 10)
                    }
                }
                .padding(.horizontal, 20)
                
                Color.gray100
                    .frame(height: 200)
                
            }
            .background(Color.main50)
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}
