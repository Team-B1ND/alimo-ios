//
//  CategoryInfoResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct CategoryInfoResponse : Decodable {
    let categoryId: Int
    let categoryName: String
    let permissions: [MemberToRoleResponse]
}
