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
            let code = try await authService.dauthToken(.init(id: id, pw: pw, clientId: dauthId, redirectUrl: baseUrl + "/redirect"))
            
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
