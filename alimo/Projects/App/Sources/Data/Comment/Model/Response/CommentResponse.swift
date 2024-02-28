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
    let commentor: Int
    let subComments: [SubCommentResponse]
}

extension CommentResponse {
    func toDomain() -> Comment {
        Comment(commentId: commentId,
                content: content,
                commentor: commentor,
                subComments: subComments.map { $0.toDomain() })
    }
}