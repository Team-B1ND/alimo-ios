//
//  OnboardingView.swift
//  App
//
//  Created by hhhello0507 on 8/4/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    
    @StateObject private var router = OnboardingRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            OnboardingFirstView()
                .navigationDestination(for: OnboardingRouter.OnboardingDestination.self) { destination in
                    switch destination {
                    case .onboardingSecond: OnboardingSecondView()
                    case .parentFindPWFirst: ParentFindPWFirstView()
                    case .parentFindPWSecond: ParentFindPWSecondView()
                    case .parentJoinFirst: ParentJoinFirstView()
                    case .parentJoinSecond(let childName): ParentJoinSecondView(childName: childName)
                    case .parentJoinThird: ParentJoinThirdView()
                    case .whatIsChildCode: WhatIsChildCodeView()
                    case .parentLoginFirst: ParentLoginFirstView()
                    case .studentLoginFirst: StudentLoginFirstView()
                    }
                }
        }
        .environmentObject(router)
    }
}
