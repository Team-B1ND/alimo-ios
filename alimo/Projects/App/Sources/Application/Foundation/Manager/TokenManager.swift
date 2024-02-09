//
//  TokenManager.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate let authCache = AuthCache.live

public class TokenManager: ObservableObject {
    
    
    @Published public var accessToken: String {
        didSet {
            authCache.saveToken(accessToken, to: .accessToken)
        }
    }

    public init() {
        self.accessToken = authCache.getToken(of: .accessToken)
    }
}