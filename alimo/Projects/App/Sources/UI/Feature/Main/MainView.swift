//
//  TabbarView.swift
//  App
//
//  Created by dgsw8th61 on 1/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct MainView: View {
    
    @State private var selectedTab = BottomNavigationType.home
    @StateObject private var profileVM = ProfileViewModel()
    @StateObject private var homeVM = HomeViewModel()
    @StateObject private var bookmarkVM = BookmarkViewModel()
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home: HomeView(vm: homeVM)
                case .bookmark: BookmarkView(vm: bookmarkVM)
                case .my: ProfileView(vm: profileVM)
                }
                GeometryReader { reader in
                    ZStack(alignment: .bottom) {
                        BottomNavigation(selectedTab: $selectedTab)
                            .shadow(color: Color.black.opacity(0.04), radius: 12)
                        VStack {
                            Color.white
                                .frame(height: reader.safeAreaInsets.top, alignment: .top)
                            Spacer()
                            Color.white
                                .frame(height: reader.safeAreaInsets.bottom, alignment: .bottom)
                        }
                        .ignoresSafeArea()
                    }
                }
            }
        }
        .onAppear {
            endTextEditing()
            appState.fetchMember()
        }
    }
}
