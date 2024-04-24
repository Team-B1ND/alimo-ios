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
    var deleteComment: () -> Void
    @State private var showing = false
    
    init(_ comment: Comment,
         onClickSubComment: @escaping () -> Void,deleteComment: @escaping () -> Void) {
        self.comment = comment
        self.onClickSubComment = onClickSubComment
        self.deleteComment = deleteComment
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top, spacing: 12) {
                AlimoAsyncAvatar(comment.profileImage, type: .small)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("\(comment.commentor)")
                            .font(.label)
                            .bold()
                        Spacer()
                        
                        Button {
                            showing = true
                        } label: {
                            Image("Roundbutton")
                                .resizable()
                                .frame(width: 17,height: 17)
                            
                        }
                        .alert("댓글을 삭제합니다", isPresented: $showing) {
                            Button("취소") {}
                            Button("삭제") {deleteComment()}
                            
                        } message: {
                            Text("댓글을 삭제 하겠습니까?")
                        }
                    }
                    
                    Text(comment.content)
                        .font(.label)
                        .padding(.top, 2)
                        .lineSpacing(5)
                    HStack(spacing: 8) {
                        Text(comment.createdAt.ymdText)
                            .foregroundStyle(Color.gray500)
                            .font(.caption)
                        
                        Button {
                            onClickSubComment()
                        } label: {
                            Text("답글달기")
                                .font(.caption)
                                .foregroundColor(.gray500)
                        }
                    }
                    .padding(.top, 4)
                }
                Spacer()
            }
            .padding(.top, 8)
        }
    }
}
