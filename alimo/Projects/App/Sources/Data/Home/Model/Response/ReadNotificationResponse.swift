//
//  ReadNotification.swift
//  App
//
//  Created by dgsw8th61 on 2/13/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

// MARK: - ReadNotificationResponse
struct ReadNotificationResponse : Decodable {
    let notificationId: Int
    let title, content: String
    let speaker: Bool
    let createdAt: String
    let memberId : Int
    let comments: [Comment]
}

// MARK: - Comment
struct Comment: Decodable {
    let commentID: Int
    let content, dateTime: String
    let commentor: Int
    let parent: Int
}

