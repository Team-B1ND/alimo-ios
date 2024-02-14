//
//  DodamTokenResponse.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct DodamTokenResponse: Decodable {
    
    let access_token: String
    let refresh_token: String
    let token_type: String
    let expires_in: String
    
}
