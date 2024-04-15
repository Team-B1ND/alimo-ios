//
//  SubComment.swift
//  App
//
//  Created by dgsw8th71 on 2/28/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct SubComment: Hashable {
    var commentId: Int
    var content: String
    var commenterId: Int
    var commentor: String
    var createdAt: Date
    var profileImage: String?
}
