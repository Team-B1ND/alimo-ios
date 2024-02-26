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
    
    var isParent: Bool
    var comment: String
    
    init(_ comment: String,
         isParent: Bool) {
        self.comment = comment
        self.isParent = isParent
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .top) {
                AlimoAvatar(type: .small)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("이예진")
                        .font(.caption)
                        .bold()
                    
                    Text(comment)
                        .font(.caption)
                        .padding(.top, 2)
                        .lineSpacing(5)
                    HStack(spacing: 8) {
                        Text("2023년 1월 1일 오후 1시")
                            .foregroundStyle(Color.gray500)
                            .font(.cute)
                        
                        if isParent {
                            Button{
                                
                            } label: {
                                Text("답글달기")
                                    .font(.cute)
                                    .foregroundColor(.gray500)
                            }
                        }
                    }
                    .padding(.top, 4)
                }
                .padding(.leading, 12)
                Spacer()
            }
            .padding(.top, 8)
        }
        if isParent {
//            CommentCeil("하이", isParent: false)
        }
    }
}


#Preview {
    CommentCeil("ㅎㅇ", isParent: true)
}

