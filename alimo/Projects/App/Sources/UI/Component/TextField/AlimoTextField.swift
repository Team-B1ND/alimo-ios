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
    let type: AlimoTextFieldType
    
    // MARK: - State
    @State private var isHide = true
    
    init(
        _ hint: String = "",
        text: Binding<String>,
        type: AlimoTextFieldType = .none(hasXMark: true)
    ) {
        self.hint = hint
        self._text = text
        self.type = type
    }
    
    // MARK: - View
    var body: some View {
        if type == .password && isHide {
            SecureField(
                hint,
                text: $text
            )
            .textFieldStyle(AlimoTextFieldStyle(type: type, text: $text, isHide: $isHide))
            .padding(.horizontal, 20)
        } else {
            TextField(
                hint,
                text: $text
            )
            .textFieldStyle(AlimoTextFieldStyle(type: type, text: $text, isHide: $isHide))
            .padding(.horizontal, 20)
        }
    }
}

struct AlimoTextFieldStyle: TextFieldStyle {
    
    private var type: AlimoTextFieldType
    @FocusState private var isFocused: Bool
    @Binding private var text: String
    @Binding private var isHide: Bool
    
    init(
        type: AlimoTextFieldType,
        text: Binding<String>,
        isHide: Binding<Bool>
    ) {
        self.type = type
        self._text = text
        self._isHide = isHide
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        let lineWidth = isFocused ? 1.5 : 1
        let strokeColor: Color = isFocused ? .main500 : .gray300
        return configuration
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable)
            .autocorrectionDisabled()
            .textContentType(.init(rawValue: ""))
            .focused($isFocused)
            .frame(height: 52)
            .background(Color.white) // for background color
            .padding(.horizontal, 16) // for inner padding
            .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
            .font(.bodyLight)
            .accentColor(.main500) // for indicator color
            .foregroundStyle(.black) // for text color
            .overlay(
                ZStack {
                    RoundedCorner(radius: Size.large.rawValue)
                        .stroke(strokeColor, lineWidth: lineWidth)
                    HStack(spacing: 0) {
                        Spacer()
                        
                        switch type {
                        case .none(let hasXMark):
                            if hasXMark && !text.isEmpty {
                                Image(Asset.xMark)
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 32, height: 32)
                                    .foregroundStyle(Color.gray500)
                                    .onTapGesture {
                                        text = ""
                                    }
                            }
                        case .password:
                            Image(isHide ? Asset.hide : Asset.show)
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 28, height: 28)
                                .foregroundStyle(Color.gray500)
                                .onTapGesture {
                                    isHide.toggle()
                                }
                        }
                    }
                    .padding(.trailing, 16)
                }
            )
            .onTapGesture {
                isFocused = true
            }
    }
}
