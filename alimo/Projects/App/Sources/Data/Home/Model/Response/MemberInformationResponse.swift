//
//  MemberInformationResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct MemberInformationResponse: Decodable {
    let memberId: Int
    let email, password: String
    let grade, room, number: Int
    let name, fcmToken: String
    let isOffAlarm: Bool
    let childCode: ChildInfoResponse
    let image: TingNotificationImageResponse
    let role: String
    let memberToRoles: [MemberToRoleResponse]
    let loginType: String
    let tingProfileImage: TingNotificationImageResponse
}
