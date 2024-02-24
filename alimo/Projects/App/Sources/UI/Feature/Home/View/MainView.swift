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
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home: HomeView()
                case .bookmark: BookMarkView()
                case .my: ProfileView()
                }
                GeometryReader { reader in
                    ZStack(alignment: .bottom) {
                        Color.white
                            .ignoresSafeArea()
                            .frame(height: reader.safeAreaInsets.bottom, alignment: .bottom)
                        VStack {
                            Spacer()
                            BottomNavigation(selectedTab: $selectedTab)
                                .shadow(color: Color.black.opacity(0.04), radius: 12)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
