//
//  BookmarkService.swift
//  App
//
//  Created by dgsw8th61 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//
import Foundation

fileprivate let client = AlimoHttpClient.live

final class BookmarkService {
    private let bookmarkupdatePath = "/book_mark/update"


    func bookmarkupdate(_ request: BookmarkupdateRequest) async throws -> Response {
        try await client.request("\(bookmarkupdatePath)",
                                 Response.self,
                                 method: .post,
                                 parameters: request)
    }
    
}

extension BookmarkService {
    static let live = BookmarkService()
}
