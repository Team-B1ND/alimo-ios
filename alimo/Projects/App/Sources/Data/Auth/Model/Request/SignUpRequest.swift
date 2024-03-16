//
//  SignUpRequest.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct SignUpRequest: Encodable {
    let email, password, fcmToken, childCode: String
    let memberId: Int
}

