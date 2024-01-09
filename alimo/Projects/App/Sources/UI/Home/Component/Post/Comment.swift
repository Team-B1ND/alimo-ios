//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Comment: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("유저이름")
                    .font(.label)
                
                Text("댓글 내용")
                    .font(.label)
                
                Text("2023년 1월 1일 오후 1시")
                    .font(.cute)
                    .foregroundColor(.gray500)
            }
        }
        .frame(maxWidth: 300, alignment: .leading)
        .padding(20)
    }
}


#Preview {
    Comment()
}
