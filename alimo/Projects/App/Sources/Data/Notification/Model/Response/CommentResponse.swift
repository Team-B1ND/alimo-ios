//
//  CommentResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/26/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct CommentResponse: Decodable {
    let commentId: Int
    let content: String
    let dateTime: String
    let commentor: Int
    let parent: Int
}

extension CommentResponse {
    func toDomain() -> Comment {
        Comment(commentId: commentId,
                content: content,
                dateTime: dateTime,
                commentor: commentor,
                parent: parent)
    }
}
