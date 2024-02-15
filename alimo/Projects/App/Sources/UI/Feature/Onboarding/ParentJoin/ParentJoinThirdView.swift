//
//  ParentJoinThirdView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import Combine

struct ParentJoinThirdView: View {
    
    @ObservedObject var vm = ParentJoinViewModel()
    
    @Environment(\.dismiss) private var dismiss
    
    @State var isAuthed: Bool = false
    @State var isSended: Bool = false
    
    @State var showTextAlert: Bool = false
    
    @State var timeRemaining : Int = 300
    let date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                Text("이메일 인증 코드를 전송했어요")
                    .font(.subtitle)
                    .foregroundStyle(Color.main900)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            
            ZStack {
                if isAuthed {
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 52)
                        .foregroundStyle(Color.main50)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay {
                            ZStack {
                                RoundedCorner(radius: Size.large.rawValue)
                                    .stroke(Color.gray300, lineWidth: 1)
                                HStack {
                                    Text(vm.code)
                                        .font(.bodyLight)
                                        .foregroundStyle(Color.gray500)
                                        .background(Color.main50)
                                    
                                    Spacer()
                                    
                                    Text("확인 완료!")
                                        .font(.label)
                                        .foregroundStyle(Color.gray500)
                                        .background(Color.main50)
                                }
                                .padding(.horizontal, 16)
                            }
                        }
                        .padding(.horizontal, 20)
                    
                } else {
                    AlimoTextField("인증 코드", text: $vm.code)
                        .foregroundStyle(.red)
                    
                    HStack {
                        Spacer()
                        
                        if isSended {
                            HStack {
                                Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                                    .font(.label)
                                    .foregroundStyle(Color.main500)
                                    .onReceive(timer) { _ in
                                        if timeRemaining != 0 {
                                            timeRemaining -= 1
                                        }
                                    }
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .frame(width: 40, height: 36)
                                        .foregroundStyle(Color.main50)
                                    
                                    AlimoSmallButton("확인", buttonType: .none) {
                                        
                                        Task {
                                            await vm.emailsVerifications()
                                            // 인증 코드가 맞는지 확인해서 밑에 조건문
                                        }
                                        
//                                        if inputAuthCode == vm.code {
//                                            isAuthed = true
//                                            showTextAlert = false
//                                        } else {
//                                            showTextAlert = true
//                                        }
                                    }
                                }
                            }
                            .frame(height: 30)
                        } else {
                            AlimoSmallButton("인증요청", buttonType: .yellow) {
                                
                                Task {
                                    await vm.emailsVerificationRequest()
                                }
                                
                                isSended = true
                            }
                        }
                        
                    }
                    .padding(.trailing, 30)
                    
                }
            }
            
            if showTextAlert {
                
                HStack {
                    Text("인증코드가 올바르지 않아요")
                        .font(.caption)
                        .foregroundStyle(Color.red500)
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 5)
                
            }
            
            Spacer()
            
            if isAuthed {
                AlimoButton("회원가입", buttonType: .yellow) {
                    print(dummyText)
                }
                .padding(.bottom, 30)
            } else {
                AlimoButton("회원가입", buttonType: .none) {
                    print(dummyText)
                }
                .disabled(true)
                .padding(.bottom, 30)
            }
            
        }
        .onAppear {
            calcRemain()
        }
        .navigationBarBackButtonHidden(true)
        .alimoToolbar("회원가입") {
            dismiss()
        }
        .onAppear {
            showTextAlert = false
        }
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
