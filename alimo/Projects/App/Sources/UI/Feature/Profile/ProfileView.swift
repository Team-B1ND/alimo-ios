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
                        withAnimation {
                            tm.accessToken = ""
                        }
                    } label: {
                        SettingCeil("로그아웃", foregroundColor: .red500)
                    }
                }
            }
            .ignoresSafeArea()
            .background(Color.gray100)
            
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
        .alert(isPresented: $showDialog) {
            var title: String
            var message: String
            if let memberInfo = vm.memberInfo {
                title = memberInfo.childCode
                message = "부모님께만 알려주세요"
            } else {
                title = "알 수 없는 에러"
                message = "다시 시도해 주세요"
            }
            return Alert(title: Text(title),
                         message: Text(message),
                         primaryButton: .cancel(Text("닫기")),
                         secondaryButton: .default(Text("복사")) {
                guard let memberInfo = vm.memberInfo else { return }
                UIPasteboard.general.string = memberInfo.childCode
            })
        }
    }
}
