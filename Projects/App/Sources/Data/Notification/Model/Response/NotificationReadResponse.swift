//
//  ReadNotificationResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import ADS

struct NotificationReadResponse: Decodable {
    let notificationId: Int
    let title: String
    let content: String
    let speaker: Bool
    let createdAt: String
    let memberId: Int
    let name: String
    let profileImage: String?
    let isBookMarked: Bool
    let emoji: String?
    let images: [ImageOrFileResponse]
    let files: [ImageOrFileResponse]
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
                         name: name,
                         profileImage: profileImage,
                         isBookMarked: isBookMarked,
                         emoji: EmojiType.fromString(emoji),
                         images: images.map { $0.toDomain() },
                         files: files.map { $0.toDomain() },
                         comments: comments.map{ $0.toDomain() })
    }
}
