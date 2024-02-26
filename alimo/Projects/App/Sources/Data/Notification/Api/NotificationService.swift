//
//  NotificationService.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


fileprivate let client = AlimoHttpClient.live

final class NotificationService {
    
    private let notificationPath = "/notification"
    
    
    func loudSpeaker() async throws -> LoudSpeaker {
        try await client.request("\(notificationPath)/speaker",
                                 ResponseData<LoudSpeakerResponse>.self,
                                 method: .get)
        .data.toDomain()
    }
    
    func getNotification(id: Int) async throws -> Notification {
        try await client.request("\(notificationPath)/read/\(id)", ResponseData<ReadNotificationResponse>.self).data
    }
    
}

extension NotificationService {
    static let live = NotificationService()
}
