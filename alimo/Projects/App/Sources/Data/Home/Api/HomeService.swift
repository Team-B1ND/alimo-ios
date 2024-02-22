//
//  HomeService.swift
//  App
//
//  Created by dgsw8th61 on 2/13/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

fileprivate let client = AlimoHttpClient.live

final class HomeService {
    private let emojiloadPath = "/emoji/load"
    private let commentcreatePath = "/comment/create"
    private let notificationspeakerPath = "/notification/speaker"
    private let notificationreadPath = "/notification/read/"
    private let getcategoryPath = "/member/category-list"
    private let notificationloadPath = "/notification/load"
    
    func emojiload(_ request: EmojiloadRequest) async throws -> Response {
        try await client.request("\(emojiloadPath)",
                                 Response.self,
                                 method: .get,
                                 parameters: request)
    }
    
    
    func commentcreate(_ request: CommentCreateRequest) async throws -> Response {
        try await client.request("\(commentcreatePath)",
                                 Response.self,
                                 method: .post,
                                 parameters: request)
    }
    
    func notificationspeaker() async throws -> Home {
        try await client.request("\(notificationspeakerPath)",
                                 ResponseData<NotificationspeakerResponse>.self,
                                 method: .get)
        .data.toDomain()
    }
    
    func notificationread(_ request: NotificationreadRequest) async throws -> ResponseData<ReadNotificationResponse> {
        try await client.request("\(notificationreadPath)",
                                 ResponseData<ReadNotificationResponse>.self,
                                 method: .get,
                                 parameters: request)
    }
    
    func getcategory() async throws -> ResponseData<MemberCategorylistResponse> {
        try await client.request("\(getcategoryPath)",
                                 ResponseData<MemberCategorylistResponse>.self,
                                 method: .get)
    }
    
    
    func notificationload(_ category : String/* request: NotificationloadRequest*/) async throws -> ResponseData<NotificationloadResponse> {
        try await client.request("\(notificationloadPath)/\(category)",
                                 ResponseData<NotificationloadResponse>.self,
                                 method: .get
                               /*  parameters: request*/)
    }
    
}

extension HomeService {
    static let live = HomeService()
}
