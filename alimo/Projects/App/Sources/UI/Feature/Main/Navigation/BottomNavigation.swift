//
//  Notice.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//


import SwiftUI

struct BottomNavigation: View {
    @Binding var selectedTab: BottomNavigationType
    
    var body: some View {
        HStack {
            let mainViews = BottomNavigationType.allCases
            ForEach(mainViews, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    BottomNavigationCeil(type: tab, isSelected: selectedTab == tab)
                }
                .applyAnimation()
            }
        }
        .padding(.top, 10)
        .background(Color.white)
        .clipShape(RoundedCorner(radius: 12))
        .onChange(of: selectedTab) { _ in
            let impactMed = UIImpactFeedbackGenerator(style: .rigid)
            impactMed.impactOccurred()
        }
    }
}
