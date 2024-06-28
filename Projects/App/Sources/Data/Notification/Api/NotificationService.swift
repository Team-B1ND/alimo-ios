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
    
    func getNotification(id: Int) async throws -> NotificationRead {
        try await client.request("\(notificationPath)/read/\(id)", ResponseData<NotificationReadResponse>.self).data.toDomain()
    }
    
    func getNotificationByCategory(category: String, request: PageRequest) async throws -> [Notification] {
        try await client.request("\(notificationPath)/load?page=\(request.page)&size=\(request.size)&category=\(category)", ResponseData<[NotificationLoadResponse]>.self).data.map { $0.toDomain() }.sorted { $0.createdAt > $1.createdAt }
    }
}

extension NotificationService {
    static let live = NotificationService()
}
