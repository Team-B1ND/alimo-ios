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
    
    @ObservedObject var vm: ParentJoinViewModel
    @EnvironmentObject var tm: TokenManager
    
    @Environment(\.dismiss) private var dismiss
    
    @State var timeRemaining : Int = 300
    let date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                let title = switch vm.emailPhase {
                case .none: "이메일 인증 코드를 전송해 주세요"
                case .sended: "이메일 인증 코드를 전송했어요"
                }
                Text(title)
                    .font(.subtitle)
                    .foregroundStyle(Color.main900)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            ZStack {
                AlimoTextField("인증 코드",
                               text: $vm.code,
                               textFieldType: .none(hasXMark: false))
                .foregroundStyle(.red)
                HStack {
                    Spacer()
                    let emailPhase = vm.emailPhase
                    if emailPhase == .none {
                        AlimoSmallButton("인증요청") {
                            Task {
                                await vm.emailsVerificationRequest()
                            }
                        }
                        .padding(.trailing, 10)
                    } else {
                        Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                            .font(.label)
                            .foregroundStyle(Color.main500)
                            .onReceive(timer) { _ in
                                if timeRemaining != 0 {
                                    timeRemaining -= 1
                                }
                            }
                            .padding(.trailing, 20)
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            let buttonType: AlimoButtonType = vm.emailPhase == .none ? .none : .yellow
            AlimoButton("확인", buttonType: buttonType, isLoading: vm.isFetching) {
                Task {
                    await vm.emailsVerifications { accessToken, refreshToken in
                        tm.accessToken = accessToken
                        tm.refreshToken = refreshToken
                    }
                }
            }
            .disabled(vm.emailPhase == .none)
            .padding(.bottom, 30)
            
        }
        .onAppear {
            calcRemain()
        }
        .navigationBarBackButtonHidden()
        .alimoToolbar("회원가입") {
            dismiss()
        }
    }
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    func calcRemain() {
        let calendar = Calendar.current
        let targetTime: Date = calendar.date(byAdding: .second, value: 300, to: date, wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
    }
}
