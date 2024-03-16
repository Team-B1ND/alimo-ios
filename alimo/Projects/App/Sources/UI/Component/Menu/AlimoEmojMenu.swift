//
//  AlimoEmojMenu.swift
//  App
//
//  Created by dgsw8th71 on 3/5/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct AlimoEmojiMenu<Content>: View where Content: View {
    
    var emojiList = EmojiType.allCases
    @State var selectedEmoji = EmojiType.allCases[0]
    @State var showMenu = false
    var callback: (EmojiType) -> Void
    var content: () -> Content
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Menu {
                ControlGroup {
                    Menus(selectedEmoji: $selectedEmoji, showMenu: $showMenu) {
                        callback($0)
                    }
                }
                .controlGroupStyle(.palette)
                .controlSize(.mini)
                .menuActionDismissBehavior(.enabled)
            } label: {
                content()
            }
        } else {
            Button {
                withAnimation {
                    showMenu = true
                }
            } label: {
                content()
            }
            .overlay {
                if showMenu {
                    ZStack {
                        HStack(spacing: 10) {
                            Menus(selectedEmoji: $selectedEmoji, showMenu: $showMenu) {
                                callback($0)
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            withAnimation {
                                showMenu = false
                            }
                        }
                        .shadow(color: Color.black.opacity(0.08), radius: 20)
                        Button {
                            withAnimation {
                                showMenu = false
                            }
                        } label: {
                            Image("XMark")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 32, height: 32)
                                .foregroundStyle(Color.gray400)
                        }
                        .toTrailing()
                        .toTop()
                        .padding(.trailing, -12)
                        .padding(.top, -12)
                    }
                    .padding(.bottom, 108)
                    .padding(.leading, 108)
                }
            }
        }
    }
}

struct Menus: View {
    
    @Binding var selectedEmoji: EmojiType
    @Binding var showMenu: Bool
    var callback: (EmojiType) -> Void
    
    var body: some View {
        
        ForEach(EmojiType.allCases, id: \.self) { emoji in
            
            let backgroundColor: Color = selectedEmoji == emoji ? .gray100 : .white
            
            Button {
                callback(emoji)
                withAnimation {
                    selectedEmoji = emoji
                    showMenu = false
                }
            } label: {
                Image(emoji.image)
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .background(backgroundColor)
            .cornerRadius(4)
        }
    }
}
