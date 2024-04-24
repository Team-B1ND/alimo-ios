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
    var deleteSubComment: () -> Void
    @State private var showing = false
    
    init(_ comment: SubComment, deleteSubComment: @escaping () -> Void) {
        self.comment = comment
        self.deleteSubComment = deleteSubComment
    }

    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                AlimoAsyncAvatar(comment.profileImage, type: .small)
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Text("\(comment.commentor)")
                            .font(.caption)
                            .bold()
                        Spacer()
                        
                        Button {
                            showing = true
                        }label: {
                            Image("Roundbutton")
                                .resizable()
                                .frame(width: 17,height: 17)
                            
                        }
                        .alert("댓글을 삭제합니다", isPresented: $showing) {
                            Button("취소") {}
                            Button("삭제") {deleteSubComment()}
                            
                        } message: {
                            Text("댓글을 삭제 하겠습니까?")
                        }
                    }
                    
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
