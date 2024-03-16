//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct SubCommentCeil: View {
    
    var comment: SubComment
    
    init(_ comment: SubComment) {
        self.comment = comment
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                if let profileImage = comment.profileImage {
                    AlimoAsyncAvatar(profileImage)
                } else {
                    AlimoAvatar(type: .small)
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(comment.commentor)")
                        .font(.caption)
                        .bold()
                    
                    Text(comment.content)
                        .font(.caption)
                        .padding(.top, 2)
                        .lineSpacing(5)
                    HStack(spacing: 8) {
                        Text(comment.createdAt.ymdText)
                            .foregroundStyle(Color.gray500)
                            .font(.cute)
                        
                    }
                    .padding(.top, 4)
                }
                .padding(.leading, 12)
                Spacer()
            }
            .padding(.top, 8)
        }
    }
}
