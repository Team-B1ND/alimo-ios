//
//  DodamTokenRequest.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct DodamTokenRequest: Encodable {
    
    let code: String
    let client_id: String
    let client_secret: String
    
}
