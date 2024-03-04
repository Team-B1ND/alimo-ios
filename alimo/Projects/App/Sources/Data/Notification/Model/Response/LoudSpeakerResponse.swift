//
//  NotificationspeakerResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/20/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct LoudSpeakerResponse: Decodable {
    let notificationId: Int
    let title: String
    let name: String
}

extension LoudSpeakerResponse {
    func toDomain() -> LoudSpeaker {
        LoudSpeaker(notificationId: notificationId,
                    title: title,
                    name: name)
    }
}
