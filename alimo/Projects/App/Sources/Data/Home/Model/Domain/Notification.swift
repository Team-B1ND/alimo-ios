//
//  Notification.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct Notification: Hashable {
    var notificationId: Int
    var title: String
    var content: String
    var speaker: Bool
    var createdAt: String
    var memberId: Int
}
