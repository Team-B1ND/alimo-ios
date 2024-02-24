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
    var image : SwiftUI.Image?
    var title : String
    var membername : String
    var content : String
    var createdAt : String
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                AlimoAvatar().padding(.leading, 12)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                Profile(newpost: true, title : title, membername: membername)
                NavigationLink {
                    DetailPostView()
                } label: {
                    Contents(content: content)
                        .padding(.top, 12)
                    
                    Postimage()
                        .padding(.vertical)
                }
                Text(createdAt)
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

