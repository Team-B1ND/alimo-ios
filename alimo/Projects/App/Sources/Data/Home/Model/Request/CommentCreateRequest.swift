//
//  CommentCreateRequest.swift
//  App
//
//  Created by dgsw8th61 on 2/13/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

// MARK: - CommentCreateRequest
struct CommentCreateRequest: Encodable {
    let content: String
    let notificationID, memberID: id
    let parent: String
}

// MARK: - id
struct id : Encodable {
    let value: Int
}
