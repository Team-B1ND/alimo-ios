//
//  MemberCategorylistResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/13/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


struct CategoryListResponse: Decodable {
    let roles: [String]
}

extension CategoryListResponse {
    func toDomain() -> CategoryList {
        CategoryList(roles: roles)
    }
}
