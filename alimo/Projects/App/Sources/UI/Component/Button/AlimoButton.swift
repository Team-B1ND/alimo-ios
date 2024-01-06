//
//  AlimoButton.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct AlimoButton: View {
    
    var text: String
    var buttonType: AlimoButtonType
    var callback: () -> Void
    
    init(_ text: String, 
         buttonType: AlimoButtonType = .yellow,
         callback: @escaping () -> Void) {
        self.text = text
        self.buttonType = buttonType
        self.callback = callback
    }
    
    var body: some View {
        Button {
            callback()
        } label: {
            Text(text)
                .font(.body)
                .frame(maxWidth: .infinity, maxHeight: 54)
                .foregroundStyle(buttonType.foregroundColor)
                .background(buttonType.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
        }
        .padding(.horizontal, 20)
    }
}
