//
//  NotificationloadResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationloadResponse : Decodable {
    let createdAt, modifiedAt: String
    let notificationId: Int
    let title, content: String
    let speaker: Bool
    let images, files: [TingNotificationImageResponse]
    let member: MemberInformationResponse
    let categories: [CategoryInfoResponse]
    let tingNotificationImage: TingNotificationImageResponse
}
