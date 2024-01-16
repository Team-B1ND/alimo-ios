//
//  ParentJoinFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ParentJoinFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var inputeCode: String = ""
    
    var body: some View {
        VStack {
            Text("학생 코드를 입력해 주세요")
                .font(Font.subtitle)
                .foregroundStyle(Color.main900)
                .padding(.trailing, 140)
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            SeparatedTextField(length: 6, string: $inputeCode)
                .padding(.horizontal, 20)
            
            Text("학생 코드가 무엇인가요?")
                .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                .foregroundStyle(Color.gray500)
                .padding(.leading, 240)
                .padding(.top, 5)
            
            Spacer()
            
            HStack {
                Text("이미 계정이 있으시다면?")
                    .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                    .foregroundStyle(Color.gray500)
                NavigationLink {
                    ParentLoginFirstView()
                } label: {
                    Text("로그인")
                        .font(Font.custom(Pretendard.medium.rawValue, size: 12))
                        .foregroundStyle(Color.main500)
                        .underline()
                }
            }
            .padding(.bottom, 5)
            
            if inputeCode != "" {
                NavigationLink {
                    ParentJoinSecondView()
                } label: {
                    AlimoButton("다음", buttonType: .yellow) {
                        print(dummyText)
                    }
                    .disabled(true)
                    .padding(.bottom, 30)
                }
            } else {
                AlimoButton("다음", buttonType: .none) {
                    print(dummyText)
                }
                .disabled(true)
                .padding(.bottom, 30)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                    
                    Text("회원가입")
                        .font(Font.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}

struct CharacterField: View {
    @State var character: String = ""
    @FocusState var focused: Int?
    @Binding var characters: [Int : String]
    
    var index: Int
    var onChange: ((_ index: Int, _ char: String) -> Void)
    
    var body: some View {
        TextField(text: $character) {
            Text("")
                .font(Font.custom(Pretendard.bold.rawValue, size: 16))
        }
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .keyboardType(.numberPad)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.white)
                .frame(height: 52)
                .clipShape(RoundedRectangle(cornerRadius: Size.large.rawValue))
                .overlay {
                    if focused == index {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.main500, lineWidth: 2)
                    } else {
                        if characters[index] != nil {
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
            onChange(index, character)
            
            if newValue.count > 1 {
                character = String(newValue[newValue.startIndex..<newValue.index(newValue.startIndex, offsetBy: 1)])
            }
        }
        .padding(.horizontal, 3)
        
    }
}

struct SeparatedTextField: View {
    var length: Int // 입력받은 글자 수
    @FocusState var focused: Int?
    // index별로 글자를 저장할 dictionary
    @State var characters: [Int : String] = [:]
    
    @Binding var string: String
    
    var body: some View {
        HStack {
            ForEach(0..<length) { i in
                CharacterField(focused: _focused, characters: $characters, index: i) { i, c in
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
