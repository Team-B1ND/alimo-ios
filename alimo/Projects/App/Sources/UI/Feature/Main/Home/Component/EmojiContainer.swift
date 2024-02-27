//
//  Emoji.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct EmojiContainer: View {
    @State private var selectedButton: Emoji?
    
    var emojies: [Emoji]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray100)
                .frame(width: 300, height: 35)
                .cornerRadius(5)
            
            HStack {
//                ForEach(emojies, id: \.self) { emoji in
//                    Button {
//                        selectedButton = selectedButton == emoji ? nil : emoji
//                    } label: {
//                        emojiImage(image: emoji.image, num: emoji.count, isSelected: selectedButton == emoji)
//                    }
//                }
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
