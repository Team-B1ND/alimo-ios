//
//  ReadNotification.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationRead: Hashable {
    var notificationId: Int
    var title: String
    var content: String
    var speaker: Bool
    var createdAt: Date
    var memberId: Int
    var name: String
    var images: [ImageOrFile]
    var files: [ImageOrFile]
    var comments: [Comment]
}
