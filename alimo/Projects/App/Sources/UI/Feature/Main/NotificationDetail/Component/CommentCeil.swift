//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct CommentCeil: View {
    
    var comment: Comment
    var onClickSubComment: () -> Void
    
    init(_ comment: Comment,
         onClickSubComment: @escaping () -> Void) {
        self.comment = comment
        self.onClickSubComment = onClickSubComment
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                AlimoAvatar(type: .small)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("\(comment.commentor)")
                        .font(.caption)
                        .bold()
                    
                    Text(comment.content)
                        .font(.caption)
                        .padding(.top, 2)
                        .lineSpacing(5)
                    HStack(spacing: 8) {
                        Text("2023년 1월 1일 오후 1시")
                            .foregroundStyle(Color.gray500)
                            .font(.cute)
                        
                        Button {
                            onClickSubComment()
                        } label: {
                            Text("답글달기")
                                .font(.cute)
                                .foregroundColor(.gray500)
                        }
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
