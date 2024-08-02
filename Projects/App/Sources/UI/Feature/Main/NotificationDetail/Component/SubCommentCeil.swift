//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI
import ADS

struct SubCommentCeil: View {
    
    private var isMe: Bool
    var comment: SubComment
    var deleteSubComment: () -> Void
    @State private var showDeleting = false
    
    init(
        _ comment: SubComment,
        isMe: Bool,
        deleteSubComment: @escaping () -> Void
    ) {
        self.comment = comment
        self.isMe = isMe
        self.deleteSubComment = deleteSubComment
    }
    
    var body: some View {
        VStack(spacing: 0) {
            AlimoComment(comment.commentor, type: .subcomment , date: comment.createdAt.ymdText, content: comment.content) {}
            //            HStack(alignment: .top, spacing: 12) {
//                AlimoAsyncAvatar(comment.profileImage, type: .small)
//                
//                VStack(alignment: .leading, spacing: 0) {
//                    HStack {
//                        Text("\(comment.commentor)")
//                            .font(.label)
//                            .bold()
//                        Spacer()
//                        if isMe {
//                            Menu {
//                                Button("삭제하기", role: .destructive) {
//                                    showDeleting = true
//                                }
//                            } label: {
//                                Image(.roundbutton)
//                                    .resizable()
//                                    .foregroundStyle(Color.gray500)
//                                    .frame(width: 20, height: 20)
//                            }
//                            .alert("정말 댓글을 삭제 하시겠습니까?", isPresented: $showDeleting) {
//                                Button("취소", role: .cancel) {}
//                                Button("삭제", role: .destructive) {
//                                    deleteSubComment()
//                                }
//                            } message: {
//                                Text("댓글을 삭제 하겠습니까?")
//                            }
//                        }
//                    }
//                    
//                    Text(LocalizedStringKey(comment.content))
//                        .applyOpenURL()
//                        .foregroundStyle(Color.black)
//                        .font(.label)
//                        .lineSpacing(4)
//                        .padding(.top, 2)
//                    HStack(spacing: 8) {
//                        Text(comment.createdAt.ymdText)
//                            .foregroundStyle(Color.gray500)
//                            .font(.caption)
//                    }
//                    .padding(.top, 4)
//                }
//                Spacer()
//            }
//            .padding(.top, 8)
        }
    }
}
