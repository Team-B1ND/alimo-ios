//
//  AlimoTextField.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct AlimoTextField: View {
    
    // MARK: - parameters
    let hint: String
    @Binding var text: String
    let textFieldType: AlimoTextFieldType
    
    init(_ hint: String = "",
         text: Binding<String>,
         textFieldType: AlimoTextFieldType = .none(hasXMark: true)) {
        self.hint = hint
        self._text = text
        self.textFieldType = textFieldType
    }
    
    // MARK: - local state
    @FocusState private var isFocused: Bool
    @State private var isHide: Bool = true
    
    // MARK: - View
    var body: some View {
        
        let lineWidth = isFocused ? 1.5 : 1
        let strokeColor: Color = isFocused ? .main500 : .gray300
        
        Group {
            if textFieldType == .password && isHide {
                SecureField(hint,
                            text: $text)
            } else {
                TextField(hint,
                          text: $text)
            }
        }
        .autocorrectionDisabled()
        .focused($isFocused)
        .frame(maxWidth: .infinity, maxHeight: 52)
        .background(Color.white)
        .padding(.horizontal, 16)
        .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
        .font(.bodyLight)
        .accentColor(.main500)
        .foregroundStyle(.black)
        .overlay(
            ZStack {
                RoundedCorner(radius: Size.large.rawValue)
                    .stroke(strokeColor, lineWidth: lineWidth)
                HStack(spacing: 0) {
                    Spacer()
                    
                    switch textFieldType {
                    case .none(let hasXMark):
                        if hasXMark && !text.isEmpty {
                            Image(Asset.xMark)
                                .renderingMode(.template)
                                .foregroundStyle(Color.gray500)
                                .onTapGesture {
                                    text = ""
                                }
                        }
                    case .password:
                        Image(isHide ? Asset.hide : Asset.show)
                            .renderingMode(.template)
                            .foregroundStyle(Color.gray500)
                            .onTapGesture {
                                isHide.toggle()
                            }
                    }
                }
                .padding(.trailing, 16)
            }
        )
        .padding(.horizontal, 20)
    }
}
