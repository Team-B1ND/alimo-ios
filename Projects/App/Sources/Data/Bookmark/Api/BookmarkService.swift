//
//  BookmarkService.swift
//  App
//
//  Created by dgsw8th61 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//
//import Foundation
//
//fileprivate let client = AlimoHttpClient.live
//
//final class BookmarkService {
//    private let bookmarkupdatePath = "/book_mark/update"
//    private let bookmarkloadPath = "/book_mark/load"
//
//
//    func bookmarkupdate(_ notificationId : Int ) async throws -> Response {
//        try await client.request("\(bookmarkupdatePath)/?notificationId=\(notificationId)",
//                                 Response.self,
//                                 method: .post)
//    }
//    
//    func bookmarkload(_ category : String , _ pageRequest: NotificationloadRequest ) async throws -> HomeResponseData<BookmarkloadResponse> {
//        try await client.request("\(bookmarkloadPath)/\(category)?page=\(pageRequest.pageRequest.page)&size=\(pageRequest.pageRequest.size)",
//                                 HomeResponseData<BookmarkloadResponse>.self,
//                                 method: .get)
//    }
//
//}
//
//extension BookmarkService {
//    static let live = BookmarkService()
//}
import Foundation


fileprivate let client = AlimoHttpClient.live

final class BookmarkService {
    private let bookmarkPath = "/bookmark"


    func patchBookmark(notificationId: Int) async throws -> Response {
        try await client.request("\(bookmarkPath)/patch/\(notificationId)",
                                 Response.self,
                                 method: .post)
    }
    
    func getBookmarkByCategory(category: String, pageRequest: PageRequest) async throws -> [Notification] {
        try await client.request("\(bookmarkPath)/load?page=\(pageRequest.page)&size=\(pageRequest.size)",
                                 ResponseData<[NotificationLoadResponse]>.self,
                                 method: .get).data.map { $0.toDomain() }
    }
}

extension BookmarkService {
    static let live = BookmarkService()
}
