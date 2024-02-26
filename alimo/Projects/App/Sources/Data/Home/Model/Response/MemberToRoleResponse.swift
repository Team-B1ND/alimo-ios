//
//  MemberToRoleResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct MemberToRoleResponse: Decodable {
    let permissionId: Int
    let permissionName, member, category: String
}
