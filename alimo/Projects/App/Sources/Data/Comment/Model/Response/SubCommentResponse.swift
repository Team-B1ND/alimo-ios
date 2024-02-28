//
//  SubCommentResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/28/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct SubCommentResponse: Decodable {
    let commentId: Int
    let content: String
    let commentor: Int
}

extension SubCommentResponse {
    func toDomain() -> SubComment {
        SubComment(commentId: commentId,
                   content: content,
                   commentor: commentor)
    }
}
