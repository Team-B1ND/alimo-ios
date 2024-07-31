//
//  ParentFindPWSecondView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentFindPWSecondView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var inputAuthCode: String = ""
    
    @State var isAuthed: Bool = false
    @State var isSended: Bool = false
    
    @State var pw: String = ""
    @State var pwCheck: String = ""
    
    @State var showAuthCodeTextAlert: Bool = false
    @State var showPasswordTextAlert: Bool = false
    
    @State var timeRemaining: Int = 300
    let date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        let isCorrectPw = Regex.validatePassword(pw)
        
        VStack {
            HStack {
                Text("이메일 인증을 해주세요")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            ZStack {
                    AlimoTextField("인증 코드", text: $inputAuthCode)
                        .foregroundStyle(.red)
                        .padding(.horizontal, 20)
                        .disabled(isAuthed)
                    
                    HStack {
                        Spacer()
                        if  isAuthed{
                            
                                Text("확인됨")
                                    .alimoFont(.bodyM)
                                    .alimoColor(AlimoColor.Label.em)
                                    .frame(height: 50)
                                    .alimoBackground(AlimoColor.Background.normal)
                            
                        } else if isSended {
                            ZStack {
                                HStack {
                                    Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                                        .alimoFont(.bodyM)
                                        .alimoColor(AlimoColor.Label.em)
                                        .onReceive(timer) { _ in
                                            if timeRemaining > 0 {
                                                timeRemaining -= 1
                                            } else {
//                                                    vm.emailPhase = .none
                                            }
                                        }
                                        .frame(height: 50)
                                    AlimoButton("확인", type: .Small) {
//                                            await vm.emailsVerifications { accessToken, refreshToken in
//                                                tm.accessToken = accessToken
//                                                tm.refreshToken = refreshToken
//                                            }
                                        isAuthed = true
                                    }
                                }
                            }
                            .frame(height: 30)
                        }
                            else {
                            AlimoButton("인증 요청", type: .Small) {
                                isSended = true
                            }
                        }
                        
                    }
                    .padding(.trailing, 30)
                }
            
            if showAuthCodeTextAlert {
                
                HStack {
                    Text("인증코드가 올바르지 않아요")
                        .font(.caption)
                        .foregroundStyle(Color.red500)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
            }
            
            if isAuthed {
                AlimoTextField("새 비밀번호", text: $pw, isSecured: true)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                AlimoTextField("새 비밀번호를 다시 입력해 주세요", text: $pwCheck, isSecured: true)
                    .padding(.horizontal, 20)
            }
            
            if showPasswordTextAlert {
                
                HStack {
                    Text("비밀번호가 다릅니다.")
                        .font(.caption)
                        .foregroundStyle(Color.red500)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
            }
            HStack {
                Group {
                    if !isCorrectPw && !pw.isEmpty {
                        Text("5~18자 영문, 숫자, 특수문자")
                    } else if pw != pwCheck && !pwCheck.isEmpty {
                        Text("비밀번호가 일치하지 않습니다")
                    }
                }
                .alimoFont(.captionM)
                .padding(.top, 4)
                .alimoColor(AlimoColor.Warning.normal)
                Spacer()
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            let isSame = pw == pwCheck
            
            NavigationLink {
                
            } label: {
                AlimoButton("완료", type: .CTA, isEnabled: isCorrectPw && isSame) {
                    showPasswordTextAlert = true
                }
                .padding(.horizontal, 20)
                .disabled(!(isCorrectPw && isSame))
                .padding(.bottom, 30)
            }
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .navigationBarBackButtonHidden(true)
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func calcRemain() {
        let calendar = Calendar.current
        let targetTime : Date = calendar.date(byAdding: .second, value: 300, to: date, wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
    }
}
