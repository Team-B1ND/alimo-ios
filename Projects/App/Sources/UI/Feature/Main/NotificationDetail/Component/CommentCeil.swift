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
    
    private let isMe: Bool
    var comment: Comment
    var onClickSubComment: () -> Void
    var deleteComment: () -> Void
    @State private var showDeleting = false
    
    init(
        _ comment: Comment,
        isMe: Bool,
        onClickSubComment: @escaping () -> Void,deleteComment: @escaping () -> Void
    ) {
        self.comment = comment
        self.isMe = isMe
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
                        
                        if isMe {
                            Menu {
                                Button("삭제하기", role: .destructive) {
                                    showDeleting = true
                                }
                            } label: {
                                Image(.roundbutton)
                                    .resizable()
                                    .foregroundStyle(Color.gray500)
                                    .frame(width: 20, height: 20)
                            }
                            .alert("정말 댓글을 삭제 하시겠습니까?", isPresented: $showDeleting) {
                                Button("취소", role: .cancel) {}
                                Button("삭제", role: .destructive) { 
                                    deleteComment()
                                }
                                
                            } message: {
                                Text("댓글을 삭제 하겠습니까?")
                            }
                        }
                    }
                    Text(LocalizedStringKey(comment.content))
                        .applyOpenURL()
                        .font(.label)
                        .foregroundStyle(Color.black)
                        .lineSpacing(4)
                        .padding(.top, 2)
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
