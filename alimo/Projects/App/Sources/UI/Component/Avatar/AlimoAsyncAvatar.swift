//
//  AlimoAsyncAvatar.swift
//  App
//
//  Created by dgsw8th71 on 3/6/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct AlimoAsyncAvatar: View {
    
    var url: String
    var type: AlimoAvatarType
    
    init(_ url: String,
         type: AlimoAvatarType = .medium
    ) {
        self.url = url
        self.type = type
    }
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: type.size, height: type.size)
                .clipShape(Circle())
        } placeholder: {
            Circle()
                .foregroundStyle(Color.gray100)
                .frame(width: type.size, height: type.size)
        }
    }
}
