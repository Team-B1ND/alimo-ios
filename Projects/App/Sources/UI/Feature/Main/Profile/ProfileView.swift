//
//  ProfileView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ProfileView: View {
    
    enum Dialog {
        case childCode, error, deleteMember
    }
    
    @ObservedObject var vm: ProfileViewModel
    
    @EnvironmentObject var tm: TokenManager
    @EnvironmentObject private var appState: AppState
    @Environment(\.dismiss) private var dismiss
    
    @State var showDialog: Bool = false
    @State var dialog = Dialog.childCode
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    HStack {
                        Text("프로필")
                            .alimoFont(.title2B)
                            .alimoColor(AlimoColor.Label.normal)
                        Spacer()
                    }
                    .padding(.horizontal, 12)

                    AlimoAvatar(appState.member?.image, type: .extraLarge)
                        .padding(.top, 16)
                    
                    Text(appState.member?.name ?? "")
                        .alimoFont(.headline2B)
                        .alimoColor(AlimoColor.Label.normal)
                        .padding(.top, 24)
                    
                    Button {
                        if appState.member?.childCode == nil {
                            dialog = .error
                        } else {
                            dialog = .childCode
                        }
                        showDialog = true
                    } label: {
                        Text("학생코드 보기")
                            .alimoFont(.labelM)
                            .alimoColor(AlimoColor.Label.em)
                            .underline()
                            .padding(.top, 4)
                    }
                    
                    HStack {
                        Text("내 카테고리")
                            .alimoFont(.bodyB)
                            .alimoColor(AlimoColor.Label.normal)
                        Spacer()
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 36)
                    
                    AlimoFlowLayout(mode: .scrollable, items: vm.categoryList) {
                        AlimoSmallButton($0, buttonType: .none) {}.disabled(true)
                    }
                    .padding(.top, 36)
                    .padding(.horizontal, 12)
                    
                    AlimoListItem("알림 설정", type: .content) {
                        AlimoToggle(isOn: .constant(true))
                    }
                    
                    AlimoListItem("다크 모드", type: .content) {
                        AlimoToggle(isOn: .constant(true))
                    }
                    
                    AlimoDivider(type: .thick)
                    
                    NavigationLink {
                        PrivacyPolicyView()
                    } label: {
                        AlimoListItem("개인정보 이용 약관", type: .icon(AlimoIconography.ExpandRight))
                            .disabled(false)
                    }
                    
                    NavigationLink {
                        ServicePolicyView()
                    } label: {
                        AlimoListItem("서비스 정책", type: .icon(AlimoIconography.ExpandRight))
                            .disabled(true)
                    }
                    
                    AlimoListItem("버전", type: .description("v1.0.0"))
                }
                .alimoBackground(AlimoColor.Background.normal)
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alert(isPresented: $showDialog) {
            switch dialog {
            case .childCode:
                Alert(title: Text(appState.member?.childCode ?? ""),
                      message: Text("부모님께만 알려주세요"),
                      primaryButton: .cancel(Text("닫기")),
                      secondaryButton: .default(Text("복사")) {
                    guard let memberInfo = appState.member else { return }
                    UIPasteboard.general.string = memberInfo.childCode
                })
            case .error:
                Alert(title: Text("알 수 없는 에러"),
                      message: Text("다시 시도해 주세요"),
                      dismissButton: .default(Text("닫기")))
            case .deleteMember:
                Alert(title: Text("정말 탈퇴하시겠습니까?"),
                      primaryButton: .cancel(Text("아니요")),
                      secondaryButton: .destructive(Text("탈퇴")) {
                    Task {
                        await vm.byebye {
                            tm.accessToken = ""
                        }
                    }
                })
            }
        }
        .task {
            appState.fetchMember()
            await vm.fetchCategoryList()
        }
    }
}
