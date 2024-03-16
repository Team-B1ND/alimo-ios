//
//  ParentLoginViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

@MainActor
class ParentLoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var pw: String = ""
    @Published var isFetching = false
    @Published var showDialog = false
    
//    @Published var show
    
    private let authService = AuthService.live
    
    func signIn(onSuccess: @escaping (String, String) -> Void) async {
        isFetching = true
        defer { isFetching = false }
        do {
            let request = SignInRequest(email: email, password: pw)
            let tokenResponse = try await authService.signIn(request)
            
            withAnimation {
                onSuccess(tokenResponse.data.accessToken, tokenResponse.data.refreshToken)
            }
            
        } catch {
            debugPrint(error)
            showDialog = true
        }
    }
}
