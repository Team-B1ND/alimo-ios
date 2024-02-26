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
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home: HomeView()
                case .bookmark: BookMarkView()
                case .my: ProfileView(vm: profileVM)
                }
                GeometryReader { reader in
                    ZStack(alignment: .bottom) {
                        BottomNavigation(selectedTab: $selectedTab)
                            .shadow(color: Color.black.opacity(0.04), radius: 12)
                        VStack {
                            Spacer()
                            Color.white
                                .frame(height: reader.safeAreaInsets.bottom, alignment: .bottom)
                        }
                        .ignoresSafeArea()
                    }
                }
            }
        }
        .task {
            await profileVM.fetchInfo()
            await profileVM.fetchCategoryList()
        }
    }
}

#Preview {
    MainView()
}
