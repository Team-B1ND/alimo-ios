//
//  Comment.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct Comment: Hashable {
    var commentId: Int
    var content: String
    var commentor: String
    var createdAt: Date
    var profileImage: String?
    var subComments: [SubComment]
}
