//
//  ReadNotificationResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationReadResponse: Decodable {
    let notificationId: Int
    let title: String
    let content: String
    let speaker: Bool
    let createdAt: String
    let memberId: Int
    let comments: [CommentResponse]
}

extension NotificationReadResponse {
    func toDomain() -> NotificationRead {
        NotificationRead(notificationId: notificationId,
                         title: title,
                         content: content,
                         speaker: speaker,
                         createdAt: Date.fromString(createdAt),
                         memberId: memberId,
                         comments: comments.map{ $0.toDomain() })
    }
}
