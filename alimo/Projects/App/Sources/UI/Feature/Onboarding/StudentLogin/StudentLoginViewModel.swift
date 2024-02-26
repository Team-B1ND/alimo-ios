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
    private let fcmCache = FcmCache.live
    
    @Published var id: String = ""
    @Published var pw: String = ""
    @Published var showError = false
    @Published var isFetching = false
    
    func signIn(onSuccess: @escaping (String, String) -> Void) async {
        isFetching = true
        defer { isFetching = false }
        do {
            
            let encryptedPw = SHA512.hash(data: Data(pw.utf8))
            let hashedString = encryptedPw.compactMap { String(format: "%02x", $0) }.joined()
            
            let code = try await authService.dauthToken(DauthTokenRequest(id: id, pw: hashedString, clientId: dauthId, redirectUrl: baseUrl + "/redirect"))
            
            let urlString = code.data.location

            if let url = URL(string: urlString) {
                if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                    
                    if let code = components.queryItems?.first(where: { $0.name == "code" })?.value {
                        print(code)
                        let fcmToken = fcmCache.getToken(of: .fcmToken)
                        let request = DodamTokenRequest(code: code,
                                                        fcmToken: fcmToken)
                        let response = try await authService.dodamToken(request).data
                        
                        withAnimation {
                            onSuccess(response.accessToken, response.refreshToken)
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
