//
//  Emoji.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Emoji: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
                .frame(width: 300, height: 35)
                .cornerRadius(5)
            
            HStack {
                Button {
                    //
                } label: {
                    emojiImage(name: "Ok")
                }
                
                Button {
                    //
                } label: {
                    emojiImage(name: "heart")
                }
                
                Button {
                    
                } label: {
                    emojiImage(name: "Funny")
                }
                
                Button {
                    
                } label: {
                    emojiImage(name: "Sad")
                }
                
                Button {
                    
                } label: {
                    emojiImage(name: "Angry")
                }
            }
        }
    }
    
    func emojiImage(name: String) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 20, height: 20)
            .cornerRadius(5)
            .padding(10)
    }
}



#Preview {
    Emoji()
}
