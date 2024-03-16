//
//  Emoji.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct EmojiContainer: View {
    
    var selectedEmoji: EmojiType?
    var emojies: [Emoji]
    var onClickEmoji: (EmojiType) -> Void
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray100)
                .frame(width: 300, height: 35)
                .cornerRadius(5)
            
            HStack {
                ForEach(emojies, id: \.self) { emoji in
                    if let emojiType = emoji.emojiType {
                        Button {
                            onClickEmoji(emojiType)
                        } label: {
                            emojiImage(image: emojiType.image, num: emoji.count, isSelected: selectedEmoji == emojiType)
                        }
                    }
                }
            }
        }
    }
    
    func emojiImage(image: String, num: Int, isSelected: Bool) -> some View {
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:  20, height:  20)
                .cornerRadius(5)
                .padding(2)
                .opacity(isSelected ? 1.0 : 0.5)
            
            Text("\(num)")
                .foregroundColor(.black)
                .opacity(isSelected ? 1.0 : 0.5)
        }
    }
}
