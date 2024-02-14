//
//  StudentLoginViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class StudentLoginViewModel: ObservableObject {
    
    private let authService = AuthService.live
    
    @Published var id: String = ""
    @Published var pw: String = ""
    
    func signIn() async {
    
        do {
            
            let tokenResponse = try await authService.dauthToken(DauthTokenRequest(id: id, pw: pw, clientId: dauthId, redirectUrl: baseUrl + "/redirect"))
            
        } catch {
            
        }
        
    }
    
}
