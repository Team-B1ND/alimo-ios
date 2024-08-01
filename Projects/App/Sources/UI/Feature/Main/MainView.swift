//
//  TabbarView.swift
//  App
//
//  Created by dgsw8th61 on 1/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI
import ADS

struct MainView: View {
    
    @State private var selectedTab = BottomTabType.Home
    @StateObject private var profileVM = ProfileViewModel()
    @StateObject private var homeVM = HomeViewModel()
    @StateObject private var bookmarkVM = BookmarkViewModel()
    @EnvironmentObject private var appState: AppState
    @EnvironmentObject private var tm: TokenManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .Home:
                    HomeView(vm: homeVM)
                case .Bookmark:
                    BookmarkView(vm: bookmarkVM)
                case .Profile:
                    ProfileView(vm: profileVM)
                }
                
                GeometryReader { reader in
                    ZStack(alignment: .bottom) {
                        AlimoBottomTabBar(selectedTab: selectedTab, onTap: { newTab in
                            selectedTab = newTab
                        }) {
                            EmptyView()
                        }
                        .padding(.bottom, reader.safeAreaInsets.bottom)
                        .ignoresSafeArea()
                    }
                }
            }
        }
        .onAppear {
            endTextEditing()
            appState.fetchMember()
        }
        .onChange(of: appState.refreshFailure) { newValue in
            if newValue {
                tm.accessToken = ""
                tm.refreshToken = ""
                appState.refreshFailure = false
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(AppState())
        .environmentObject(TokenManager())
}
