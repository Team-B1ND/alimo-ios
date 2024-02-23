//
//  NotificationloadResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct NotificationloadResponse : Decodable {
    let createdAt, modifiedAt: String
    let notificationId: Int
    let title, content: String
    let speaker: Bool
    let images, files: [TingNotificationImageResponse]
    let member: MemberInfo
    let categories: [Categoryies]
    let tingNotificationImage: TingNotificationImageResponse
}

struct Categoryies : Decodable {
    let categoryId: Int
    let categoryName: String
    let permissions: [MemberToRoleResponse]
}

struct MemberToRoleResponse: Decodable {
    let permissionId: Int
    let permissionName, member, category: String
}

struct TingNotificationImageResponse: Decodable {
    let fileId: Int
    let fileUrl, fileName: String
    let fileSize: Int
    let fileType: String
}

struct MemberInfo: Decodable {
    let memberId: Int
    let email, password: String
    let grade, room, number: Int
    let name, fcmToken: String
    let isOffAlarm: Bool
    let childCode: ChildCode
    let image: TingNotificationImageResponse
    let role: String
    let memberToRoles: [MemberToRoleResponse]
    let loginType: String
    let tingProfileImage: TingNotificationImageResponse
}

struct ChildCode: Decodable {
    let childCode, childName: String
    let cnt: Int
}
