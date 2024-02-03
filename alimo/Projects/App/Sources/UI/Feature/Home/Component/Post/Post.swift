//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Post: View {
    
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                AlimoAvatar().padding(.leading, 12)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                Profile(newpost: true)
                NavigationLink {
                    DetailPostView()
                } label: {
                    Contents()
                        .padding(.top, 12)
                }
                Text("2023년 1월 33일 25시 -1분")
                    .foregroundStyle(Color.gray500)
                    .font(.cute)
                    .padding(.top, 12)
                Icons()
                    .padding(.top, 12)
            }
        }
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }
}


#Preview {
    Post()
}
