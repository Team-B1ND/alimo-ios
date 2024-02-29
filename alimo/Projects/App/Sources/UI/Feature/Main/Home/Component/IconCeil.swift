//
//  Icons.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct IconCeil: View {
    
    var isBookmarked: Bool
    var onClickBookmark: () -> Void
    
    var body: some View {
        HStack(spacing: 8) {
            PostIcon("AddImoji")
            PostIcon("Chat")
            
            Spacer()
            
            Button {
                onClickBookmark()
            } label: {
                if isBookmarked {
                    Image(AppAsset.Assets.clickedBookmark.name)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                } else {
                    Image(AppAsset.Assets.bookmark.name)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(Color.gray500)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                }
            }
        }
    }
    
    private func PostIcon(_ name: String) -> some View {
        Image(name)
            .resizable()
            .renderingMode(.template)
            .foregroundStyle(Color.gray500)
            .frame(width: 24, height: 24)
    }
}
