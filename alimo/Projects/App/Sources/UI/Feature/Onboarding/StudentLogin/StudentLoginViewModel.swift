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
    
    func signIn() async {
        
//        authService.signInByDodam()
        
    }
    
}
