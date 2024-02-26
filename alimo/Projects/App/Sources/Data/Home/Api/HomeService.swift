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
    private let emojistatusPath = "/emoji/status"
    private let commentcreatePath = "/comment/create"
    private let notificationspeakerPath = "/notification/speaker"
    private let notificationreadPath = "/notification/read"
    private let getcategoryPath = "/member/category-list"
    private let notificationloadPath = "/notification/load"
    
    
    func emojiload(_ notificationId : Int) async throws -> Response {
        try await client.request("\(emojistatusPath)/?notificationId=\(notificationId)",
                                 Response.self,
                                 method: .get)
    }
    
    func emojistatus(_ notificationId : Int ,_ emoji : String) async throws -> Response {
        try await client.request("\(emojistatusPath)/?notificationId=\(notificationId)",
                                 Response.self,
                                 method: .patch,
                                 parameters: emoji)
    }
    
    
    func commentcreate(_ request: CommentCreateRequest) async throws -> Response {
        try await client.request("\(commentcreatePath)",
                                 Response.self,
                                 method: .post,
                                 parameters: request)
    }
    
    func loudSpeaker() async throws -> LoudSpeaker {
        try await client.request("\(notificationspeakerPath)",
                                 ResponseData<LoudSpeakerResponse>.self,
                                 method: .get)
        .data.toDomain()
    }
    
    func notificationread(_ notificationId : Int) async throws -> ResponseData<ReadNotificationResponse> {
        try await client.request("\(notificationreadPath)/?notificationId=\(notificationId)",
                                 ResponseData<ReadNotificationResponse>.self,
                                 method: .get)
    }
    
    func getcategory() async throws -> CategoryList {
        try await client.request("\(getcategoryPath)",
                                 ResponseData<CategoryListResponse>.self,
                                 method: .get).data.toDomain()
    }
    


    func notificationLoad(_ category: String, pageRequest: NotificationloadRequest) async throws -> [Notification] {
        try await client.request("\(notificationloadPath)/\(category)?page=\(pageRequest.page)&size=\(pageRequest.size)",
                                 ResponseData<[NotificationLoadResponse]>.self,
                                 method: .get).data.map { $0.toDomain() }
    }
}

extension HomeService {
    static let live = HomeService()
}
