//
//  ParentJoinViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class ParentJoinViewModel: ObservableObject {
    
    private var onboardingService = OnboardingService.live
    
    @Published var code: String = ""
    
    func emailsVerificationRequest() async {
    
        do {
            
            let _ = try await onboardingService.emailsVerificationRequest(onboardingService.getMemberInfo().data.email)
        } catch {
            
        }
        
    }
    
    func emailsVerifications() async {
    
        do {
            
            let _ = try await onboardingService.emailsVerifications(EmailsVerificationsRequest(email: onboardingService.getMemberInfo().data.email, code: code))
            
        } catch {
            
        }
        
    }
}
