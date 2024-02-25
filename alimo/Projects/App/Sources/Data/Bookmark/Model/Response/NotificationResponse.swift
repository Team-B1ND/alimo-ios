//
//  NotificationResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationResponse: Decodable {
    let createdAt, modifiedAt: String
    let notificationId: Int
    let title, content: String
    let speaker: Bool
    let images, files: [ImageResponse]
    let member: MemberResponse
    let categories: [CategoriesResponse]
    let tingNotificationImage: ImageResponse
}


