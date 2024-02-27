//
//  NotificationLoadResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationLoadResponse: Decodable {
    let notificationId: Int
    let title: String
    let content: String
    let speaker: Bool
    let createdAt: String
    let memberId: Int
}

extension NotificationLoadResponse {
    func toDomain() -> Notification {
        Notification(notificationId: notificationId,
                     title: title,
                     content: content,
                     speaker: speaker,
                     createdAt: Date.fromString(createdAt),
                     memberId: memberId)
    }
}
