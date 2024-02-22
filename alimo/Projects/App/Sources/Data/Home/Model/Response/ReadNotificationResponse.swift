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
    let notificationid: Int
    let title, content: String
    let speaker: Bool
    let createdAt, member: String
    let comments: [Comment]
}

// MARK: - Comment
struct Comment: Decodable {
    let commentID: ID
    let content, dateTime: String
    let notice: Notices
    let commentor: Commentor
    let parent: String
}

// MARK: - ID
struct ID: Decodable {
    let value: Int
}

// MARK: - Commentor
struct Commentor: Decodable {
    let memberID: ID
    let name: String
}

// MARK: - Notice
struct Notices: Decodable {
    let notificationID: ID
}
