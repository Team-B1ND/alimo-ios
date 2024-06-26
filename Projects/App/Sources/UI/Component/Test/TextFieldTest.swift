//
//  TextFieldTest.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct TextFieldTest: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    
    var body: some View {
        VStack {
            AlimoTextField("아이디를 입력하세요", text: $id, type: .none(hasXMark: false))
            AlimoTextField("아이디를 입력하세요", text: $id)
            AlimoTextField("비밀번호를 입력하세요", text: $pw, type: .password)
        }
    }
}
