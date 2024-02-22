//
//  NotificationspeakerResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/20/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationspeakerResponse : Decodable {
    let notificationID: Int?
    let title: String
    let memberID: Int?
}

extension NotificationspeakerResponse {
    func toDomain() -> Home {
        Home(notificationID: notificationID,
             title: title,
             memberID: memberID)
    }
}
