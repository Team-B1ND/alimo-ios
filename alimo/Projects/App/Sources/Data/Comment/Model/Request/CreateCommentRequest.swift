//
//  CommentCreateRequest.swift
//  App
//
//  Created by dgsw8th61 on 2/13/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct CreateCommentRequest: Encodable {
    let content: String
    let notificationId: Int
    let parent: String
}
