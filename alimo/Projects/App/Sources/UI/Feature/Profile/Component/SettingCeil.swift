//
//  SettingCeil.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct SettingCeil<C>: View where C: View{
    
    var text: String
    var foregroundColor: Color
    var content: (() -> C)?
    
    init(_ text: String,
         foregroundColor: Color = .black,
         content: (() -> C)? = { EmptyView() }) {
        self.text = text
        self.foregroundColor = foregroundColor
        self.content = content
    }
    
    var body: some View {
        HStack {
            Text(text)
                .font(.bodyLight)
                .foregroundStyle(foregroundColor)
            Spacer()
            if let content = content {
                content()
            }
        }
        .padding(.horizontal, 20)
        .frame(height: 60)
        .background(Color.white)
    }
}
