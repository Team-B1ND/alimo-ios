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
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray100)
                .frame(width: 300, height: 35)
                .cornerRadius(5)
            
            HStack {
                ForEach(emojis, id: \.self) { emoji in
                    Button(action: {
                        selectedButton = selectedButton == emoji ? nil : emoji
                    }) {
                        emojiImage(name: emoji, isSelected: selectedButton == emoji)
                    }
                }
            }
        }
    }
    
    func emojiImage(name: String, isSelected: Bool) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: isSelected ? 23 : 20, height: isSelected ? 23 : 20)
            .cornerRadius(5)
            .padding(10)
            .opacity(isSelected ? 1.0 : 0.5)
    }
}

#Preview {
    Emoji()
}
