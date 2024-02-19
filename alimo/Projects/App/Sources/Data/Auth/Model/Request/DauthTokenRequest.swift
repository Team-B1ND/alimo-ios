//
//  DauthTokenResponse.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct DauthTokenRequest: Encodable {
    
    let id: String
    let pw: String
    let clientId: String
    let redirectUrl: String
    
}
