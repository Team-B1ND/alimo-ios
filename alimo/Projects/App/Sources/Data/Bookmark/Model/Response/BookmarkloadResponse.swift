//
//  d.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


struct BookmarkloadResponse : Decodable {
    let createdAt, modifiedAt: String
    let id: Int
    let notification: NotificationResponse
    let member: MemberResponse
    let status: Bool
    let dateTime: String
}

struct NotificationResponse: Decodable {
    let createdAt, modifiedAt: String
    let notificationId: Int
    let title, content: String
    let speaker: Bool
    let images, files: [Image]
    let member: MemberResponse
    let categories: [CategoriesResponse]
    let tingNotificationImage: Image
}

struct Image: Decodable {
    let fileID: Int
    let fileURL, fileName: String
    let fileSize: Int
    let fileType: String
}

struct CategoriesResponse: Decodable {
    let categoryID: Int
    let categoryName: String
    let permissions: [String]
}

struct MemberResponse: Decodable {
    let createdAt, modifiedAt: String
    let memberID: Int
    let email, password: String
    let grade, room, number: Int
    let name, fcmToken: String
    let isOffAlarm: Bool
    let childCode: ChildInfo
    let image: Image
    let role, loginType: String
    let memberToRoles: [MemberToRole]
    let tingProfileImage: Image
}

struct ChildInfo: Decodable {
    let childCode, childName: String
    let cnt: Int
}


struct MemberToRole: Decodable {
    let permissionID: Int
    let permissionName, member: String
    let category: CategoriesResponse
}
