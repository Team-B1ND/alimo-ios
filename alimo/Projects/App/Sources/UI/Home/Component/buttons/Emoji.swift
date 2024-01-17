//
//  Emoji.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct Emoji: View {
    @State private var selectedButton: String?
    
    let emojis = [
        "Ok", "heart", "Funny", "Sad", "Angry"
    ]
    
    var emojiNum: [String: Int] = [
        "Ok": 0,
        "heart": 0,
        "Funny": 0,
        "Sad": 0,
        "Angry": 0
    ]
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray100)
                .frame(width: 350, height: 35)
                .cornerRadius(5)
            
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button(action: {
                        selectedButton = selectedButton == emoji ? nil : emoji
                    }) {
                        emojiImage(name: emoji, num: emojiNum[emoji] ?? 0, isSelected: selectedButton == emoji)
                    }
                }
            }
        }
    }
    
    func emojiImage(name: String, num: Int, isSelected: Bool) -> some View {
        HStack {
            Image(name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: isSelected ? 23 : 20, height: isSelected ? 23 : 20)
                .cornerRadius(5)
                .padding(10)
                .opacity(isSelected ? 1.0 : 0.5)
            
            Text("\(num)")
                .foregroundColor(.black)
                .opacity(isSelected ? 1.0 : 0.5)
        }
    }
}

#Preview {
    Emoji()
}
