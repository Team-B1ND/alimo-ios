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
    private let emojiload = "/emoji/load"
    private let commentcreate = "/comment/create"
    private let bookmarkupdate = "/book_mark/update"
    private let notificationspeaker = "/notification/speaker"
    private let notificationread = "/notification/read/"
    private let getcategory = "/category/get-category"
    
    func commentcreate(_ request: CommentCreateRequest) async throws -> Response {
        try await client.request("\(commentcreate)",
                                 Response.self,
                                 method: .post,
                                 parameters: request)
    }
}
