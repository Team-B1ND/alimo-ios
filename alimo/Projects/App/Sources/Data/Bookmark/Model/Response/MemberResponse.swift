//
//  MemberResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct MemberResponse: Decodable {
    let createdAt, modifiedAt: String
    let memberID: Int
    let email, password: String
    let grade, room, number: Int
    let name, fcmToken: String
    let isOffAlarm: Bool
    let childCode: ChildInfoResponse
    let image: ImageResponse
    let role, loginType: String
    let memberToRoles: [MemberToRolesResponse]
    let tingProfileImage: ImageResponse
}
