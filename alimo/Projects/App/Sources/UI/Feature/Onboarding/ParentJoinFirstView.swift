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
    
    @State var inputCode: String = ""
    
    @State var showDialog: Bool = false
    
    let dummyStudentCode: String = "123456"
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack {
                    Text("학생 코드를 입력해 주세요")
                        .font(.subtitle)
                        .foregroundStyle(Color.main900)
                        .padding(.leading, 24)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                    Spacer()
                }
                
                SeparatedTextField(length: 6, string: $inputCode)
                    .padding(.horizontal, 20)
                
                HStack {
                    Spacer()
                    Text("학생 코드가 무엇인가요?")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                        .padding(.trailing, 24)
                        .padding(.top, 8)
                }
                
                Spacer()
                
                HStack {
                    Text("이미 계정이 있으시다면?")
                        .font(.caption)
                        .foregroundStyle(Color.gray500)
                    NavigationLink {
                        ParentLoginFirstView()
                    } label: {
                        Text("로그인")
                            .font(.caption)
                            .foregroundStyle(Color.main500)
                            .underline()
                    }
                }
                .padding(.bottom, 16)
                
                let isCompleted: Bool = inputCode.count == 6
                let isSame: Bool = inputCode == dummyStudentCode
                let buttonType: AlimoButtonType = isCompleted && isSame ? .yellow : .none
                
                NavigationLink {
                    ParentJoinSecondView()
                } label: {
                    AlimoButton("다음", buttonType: buttonType) {
                        showDialog = true
                    }
                    .disabled(isCompleted && isSame)
                    .padding(.bottom, 30)
                }
            }
            .navigationBarBackButtonHidden()
            .alimoToolbar("회원가입") {
                dismiss()
            }
            
            if showDialog {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(.white)
                            .frame(width: 290, height: 160)
                            .overlay {
                                VStack {
                                    Text("올바르지 않은 학생 코드")
                                        .font(.subtitle)
                                        .padding(.bottom, 7)
                                    
                                    Text("학생 코드를 다시 확인해 주세요")
                                        .font(.bodyLight)
                                        .foregroundStyle(Color.gray500)
                                        .padding(.bottom, 8)
                                    
                                    HStack {
                                        Spacer()
                                        
                                        Button {
                                            showDialog = false
                                        } label: {
                                            Text("닫기")
                                                .foregroundStyle(Color.gray500)
                                                .frame(width: 50, height: 40)
                                                .background(Color.gray100)
                                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                        }
                                    }
                                    .padding(.horizontal, 30)
                                    .padding(.bottom, 5)
                                    
                                }
                            }
                            .padding(.bottom, 100)
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
                .font(.body)
        }
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
