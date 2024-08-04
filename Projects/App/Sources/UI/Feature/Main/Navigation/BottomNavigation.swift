////
////  Notice.swift
////  App
////
////  Created by dgsw8th61 on 1/7/24.
////  Copyright © 2024 b8nd. All rights reserved.
////
//
//
//import SwiftUI
//import ADS
//
//struct BottomNavigation: View {
//    @Binding var selectedTab: BottomNavigationType
//    
//    init(
//        selectedTab: Binding<BottomNavigationType>
//    ) {
//        self._selectedTab = selectedTab
//    }
//    
//    var body: some View {
//        let mainViews = BottomNavigationType.allCases
//        HStack {
//            ForEach(mainViews, id: \.self) { tab in
//                Button {
//                    selectedTab = tab
//                } label: {
//                    HStack {
//                        Spacer()
//                        BottomNavigationCeil(type: tab, isSelected: selectedTab == tab)
//                        Spacer()
//                    }
//                    .background(.white)
//                }
//                .applyAnimation()
//            }
//        }
//        .padding(.horizontal, 28)
//        .padding(.top, 10)
//        .padding(.bottom, 4)
//        .background(.white)
//        .cornerRadius(16, corners: .allCorners)
//        .shadow(color: Color.black.opacity(0.04), radius: 12)
//        .onChange(of: selectedTab) { _ in
//            let impactMed = UIImpactFeedbackGenerator(style: .soft)
//            impactMed.impactOccurred()
//        }
//    }
//}
