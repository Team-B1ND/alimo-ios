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
                    let strokeColor: Color =
                    focused == index ? .gray500 :
                    characters[index] != nil && characters[index] != "" ? .main500 : .gray400
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(strokeColor, lineWidth: 2)
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
