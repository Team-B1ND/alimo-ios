//
//  OnboardingFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct LaunchScreenView: View {
    
    @EnvironmentObject private var colorProvider: ColorProvider
    
    var body: some View {
        ZStack(alignment: .center) {
            colorProvider.color(AlimoColor.Color.primary60)
                .ignoresSafeArea()
            
            Image("AppIconImage")
                .resizable()
                .frame(width: 180, height: 180)
        }
    }
}
