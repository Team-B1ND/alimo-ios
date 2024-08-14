//
//  OnboardingDestination.swift
//  App
//
//  Created by hhhello0507 on 8/4/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import SwiftUI

final class OnboardingRouter: ObservableObject {
    
    enum OnboardingDestination: Hashable {
        case onboardingSecond
        case parentFindPWFirst
        case parentFindPWSecond
        case parentJoinFirst
        case parentJoinSecond(childName: String?)
        case parentJoinThird
        case whatIsChildCode
        case parentLoginFirst
        case studentLoginFirst
    }
    
    @Published var path = NavigationPath()
    
    func navigateTo(_ destination: OnboardingDestination) {
        path.append(destination)
    }
    
    func navigateToRoot() {
        path.removeLast(path.count)
    }
    
    func popToStack() {
        path.removeLast()
    }
}
