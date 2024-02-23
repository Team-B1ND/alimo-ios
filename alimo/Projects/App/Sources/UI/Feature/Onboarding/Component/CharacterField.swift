//
//  a.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct CharacterField: View {
    @State var character: String = ""
    @FocusState var focused: Int?
    @Binding var characters: [Int : String]
    
    var index: Int
    var onChange: ((String) -> Void)
    
    var body: some View {
        TextField(text: $character) {
            Text("")
                .font(.body)
        }
        .autocorrectionDisabled()
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)
                .frame(height: 52)
                .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
                .overlay {
                    if focused == index {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray500, lineWidth: 2)
                    } else {
                        if characters[index] != nil && characters[index] != "" {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.main500, lineWidth: 2)
                        } else {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray300, lineWidth: 2)
                        }
                    }
                }
        )
        .frame(maxWidth: .infinity, alignment: .center)
        .focused($focused, equals: index)
        .onChange(of: character) { newValue in
            onChange(character)
            
            if newValue.count > 1 {
                character = String(newValue[newValue.startIndex..<newValue.index(newValue.startIndex, offsetBy: 1)])
            }
        }
        .padding(.horizontal, 3)
        
    }
}
