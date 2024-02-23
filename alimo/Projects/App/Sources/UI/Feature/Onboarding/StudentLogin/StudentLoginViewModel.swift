//
//  StudentLoginViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import CryptoKit
import SwiftUI

@MainActor
class StudentLoginViewModel: ObservableObject {
    
    private let authService = AuthService.live
    
    @Published var id: String = ""
    @Published var pw: String = ""
    @Published var showError = false
    
    func signIn(onSuccess: @escaping (String) -> Void) async {
    
        do {
            
            let encryptedPw = SHA512.hash(data: Data(pw.utf8))
            let hashedString = encryptedPw.compactMap { String(format: "%02x", $0) }.joined()
            
            let code = try await authService.dauthToken(DauthTokenRequest(id: id, pw: hashedString, clientId: dauthId, redirectUrl: baseUrl + "/redirect"))
            
            let urlString = code.data.location

            if let url = URL(string: urlString) {
                if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    
                    if let code = components.queryItems?.first(where: { $0.name == "code" })?.value {
                        print(code)
                        let dodamResponse = try await authService.dodamToken(DodamTokenRequest(code: code, fcmToken: "rlaehdcks"))
                        print(dodamResponse.data.accessToken)
                        
                        withAnimation {
                            onSuccess(dodamResponse.data.accessToken)
                        }
                    } else {
                        showError = true
                    }
                } else {
                    showError = true
                }
            } else {
                showError = true
            }
        } catch {
            showError = true
        }
    }
}
