//
//  SeparatedTextField.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct SeparatedTextField: View {
    var length: Int // 입력받은 글자 수
    @FocusState var focused: Int?
    // index별로 글자를 저장할 dictionary
    @State var characters: [Int : String] = [:]
    
    @Binding var string: String
    
    var body: some View {
        HStack {
            ForEach(0..<length, id: \.self) { i in
                CharacterField(focused: _focused, characters: $characters, index: i) { c in
                    focused = c.isEmpty ? i - 1 : i + 1
                    characters[i] = c
                    string = getString()
                }
            }
        }.padding([.vertical], 16)
    }
    
    func getString() -> String {
        var str = ""
        for i in 0..<length {
            if let c = characters[i] {
                str += c
            }
        }
        return str
    }
}

