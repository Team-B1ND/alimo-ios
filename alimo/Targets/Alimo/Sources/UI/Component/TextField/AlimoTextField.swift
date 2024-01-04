//
//  AlimoTextField.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct AlimoTextField<SC>: View where SC: View {
    
    let hint: String
    @Binding var text: String
    @ViewBuilder let secondaryContent: () -> SC
    
    @State var isFocused: Bool = false
    
    init(_ hint: String = "",
         text: Binding<String>,
         @ViewBuilder secondaryContent: @escaping () -> SC = { EmptyView() }) {
        self.hint = hint
        self._text = text
        self.secondaryContent = secondaryContent
    }
    
    var body: some View {
        
        let lineWidth = isFocused ? 1.5 : 1
        let strokeColor: Color = isFocused ? .main500 : .gray300
        
        TextField(hint,
                  text: $text,
                  onEditingChanged: getFocus)
        .frame(maxWidth: .infinity, maxHeight: 52)
        .background(Color.white)
        .padding(.horizontal, 16)
        .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
        .overlay(
            ZStack {
                RoundedCorner(radius: Size.large.rawValue)
                    .stroke(strokeColor, lineWidth: lineWidth)
                HStack(spacing: 0) {
                    Spacer()
                    secondaryContent()
                        .padding(.trailing, 16)
                }
            }
        )
        .font(.bodyLight)
        .accentColor(.main500)
        .foregroundStyle(.black)
        .padding(.horizontal, 20)
    }
    
    func getFocus(focused: Bool) {
        isFocused = focused
    }
}
