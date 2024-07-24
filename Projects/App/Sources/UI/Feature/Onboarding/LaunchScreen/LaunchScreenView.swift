//
//  OnboardingFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/10/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.main500
                .ignoresSafeArea()
            
            Image(.alimoIcon)
                .resizable()
                .frame(width: 180, height: 180)
        }
    }
}
