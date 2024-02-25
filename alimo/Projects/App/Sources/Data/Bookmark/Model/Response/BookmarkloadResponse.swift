//
//  d.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


struct BookmarkloadResponse : Decodable {
    let createdAt, modifiedAt: String
    let id: Int
    let notification: NotificationResponse
    let member: MemberResponse
    let status: Bool
    let dateTime: String
}

