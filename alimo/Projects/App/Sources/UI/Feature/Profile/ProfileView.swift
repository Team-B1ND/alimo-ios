//
//  ProfileView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var vm = ProfileViewModel()
    
    @EnvironmentObject var tm: TokenManager
    
    @State var isCodeClicked: Bool = false
    @State var isAnimating: Bool = false
    
    @State var showDialog: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    HStack {
                        AlimoLogo(type: .gray)
                        Spacer()
                    }
                    .padding(.top, 60)
                    .padding(.horizontal, 20)
                    
                    if let image = vm.memberInfo?.image {
                        AsyncImage(url: URL(string: image))
                        {
                            $0
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            Circle()
                                .foregroundStyle(Color.gray100)
                                .frame(width: 100, height: 100)
                        }
                    } else {
                        AlimoAvatar(type: .large)
                    }
                    
                    Text(vm.memberInfo?.name ?? "")
                        .font(Font.body)
                        .padding(.top, 10)
                    
                    Button {
                        showDialog = true
                    } label: {
                        Text("학생코드")
                            .font(.caption)
                            .foregroundStyle(Color.gray500)
                            .underline()
                    }
                    
                    AlimoFlowLayout(mode: .scrollable,
                               items: vm.categoryList) {
                        Text($0)
                            .font(.caption)
                            .foregroundStyle(Color.gray500)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.gray100)
                            .clipShape(Capsule())
                    }
                               .padding()
                    
                    SettingCeil("알림 설정") {
                        AlimoToggle(isOn: $vm.isAlarmOn)
                    }
                }
                .background(Color.main50)
                
                VStack(spacing: 0) {
                    Button {
                        print("ProfileView - 개인정보 이용 약관")
                    } label: {
                        SettingCeil("개인정보 이용 약관")
                    }
                    
                    Button {
                        print("ProfileView - 개인정보 이용 약관")
                    } label: {
                        SettingCeil("서비스 정책")
                    }
                    
                    SettingCeil("버전") {
                        Text("v\(version ?? " -")")
                            .font(.bodyLight)
                            .foregroundStyle(Color.gray500)
                    }
                    
                    Divider()
                        .foregroundStyle(Color.gray100)
                        .padding(.horizontal, 12)
                    
                    Button {
                        tm.accessToken = ""
                    } label: {
                        SettingCeil("로그아웃", foregroundColor: .red500)
                    }
                }
            }
            .ignoresSafeArea()
            .background(Color.gray100)
            
            VStack {
                Spacer()
                
                RoundedCorner(radius: 4)
                    .frame(height: 50)
                    .foregroundStyle(.white)
                    .shadow(radius: 0)
                    .overlay {
                        HStack {
                            Text("복사에 성공하였습니다!")
                                .font(.body)
                            
                            Spacer()
                            
                            Button {
                                isCodeClicked = false
                                isAnimating = false
                            } label: {
                                
                                Text("닫기")
                                    .font(Font.bodyLight)
                                    .foregroundStyle(Color.yellow)
                                
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                    .offset(y : isAnimating ? 0 : 100)
                    .animation(.bouncy(duration: 0.5), value: isAnimating)
                
            }
            
            if showDialog {
                
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .overlay {
                        
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.white)
                            .frame(width: 290, height: 160)
                            .overlay {
                                
                                VStack {
                                    
                                    HStack {
                                        Text("\(vm.memberInfo?.childCode ?? "")")
                                            .font(.subtitle)
                                        
                                        Button {
                                            
                                            UIPasteboard.general.string = vm.memberInfo?.childCode ?? ""
                                            showDialog = false
                                            isCodeClicked = true
                                            isAnimating = true
                                            
                                        } label: {
                                            Image(Asset.copy)
                                        }
                                        
                                    }
                                    .padding(.bottom, 5)
                                    
                                    Text("부모님께만 공유해주세요")
                                        .font(.bodyLight)
                                        .foregroundStyle(Color.gray500)
                                        .padding(.bottom, 5)
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Button {
                                            showDialog = false
                                        } label: {
                                            
                                            Text("닫기")
                                                .foregroundStyle(Color.gray500)
                                                .frame(width: 50, height: 40)
                                                .background(Color.gray100)
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                            
                                        }
                                    }
                                    .padding(.horizontal, 30)
                                    .padding(.bottom, 5)
                                    
                                }
                            }
                            .padding(.bottom, 100)
                        
                    }
            }
        }
        
        .task {
            await vm.getInfo()
        }
        .onAppear {
            UIScrollView.appearance().bounces = false
        }
        .onDisappear {
            UIScrollView.appearance().bounces = true
        }
    }
}
