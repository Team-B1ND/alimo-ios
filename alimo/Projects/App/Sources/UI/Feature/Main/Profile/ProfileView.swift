//
//  ProfileView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var vm: ProfileViewModel
    
    @EnvironmentObject var tm: TokenManager
    
    @State var showDialog: Bool = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                AlimoLogoBar()
                Group {
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
                }
                .padding(.top, 46)
                
                Text(vm.memberInfo?.name ?? "")
                    .font(Font.body)
                    .padding(.top, 24)
                Button {
                    showDialog = true
                } label: {
                    Text("학생코드")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                        .underline()
                        .padding(.top, 8)
                }
                
                AlimoFlowLayout(mode: .scrollable, items: vm.categoryList) {
                    AlimoSmallButton($0, buttonType: .none) {}.disabled(true)
                }
                .padding(.top, 36)
                .padding(.horizontal, 12)
                
                SettingCeil("알림 설정") {
                    AlimoToggle(isOn: $vm.isAlarmOn)
                }
                .padding(.top, 28)
                Color.gray100
                    .frame(height: 10)
                    .frame(maxWidth: .infinity)
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
                
                Color.gray100
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 12)
                
                Button {
                    withAnimation {
                        tm.accessToken = ""
                    }
                } label: {
                    SettingCeil("로그아웃", foregroundColor: .red500)
                }
                
                Button {
                    Task {
                        await vm.byebye {
                            tm.accessToken = ""
                        }
                    }
                } label: {
                    SettingCeil("회원탈퇴", foregroundColor: .red500)
                }
            }
            .background(Color.white)
            Color.gray100
                .frame(height: 100)
        }
        .alert(isPresented: $showDialog) {
            var title: String
            var message: String
            if let childCode = vm.memberInfo?.childCode {
                title = childCode
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
