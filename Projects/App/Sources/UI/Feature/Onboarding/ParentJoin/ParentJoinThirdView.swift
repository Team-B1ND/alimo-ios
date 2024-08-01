//
//  ParentJoinThirdView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import Combine
import ADS

struct ParentJoinThirdView: View {
    
    @EnvironmentObject var vm: ParentJoinViewModel
    @EnvironmentObject var tm: TokenManager
    
    @Environment(\.dismiss) private var dismiss
    
    @State var timeRemaining : Int = 300
    let date = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            HStack {
                let title = "이메일 인증을 해주세요"
                Text(title)
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .padding(.leading, 24)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                Spacer()
            }
            ZStack {
                AlimoTextField("인증 코드", text: $vm.code)
                .keyboardType(.asciiCapable)
                .foregroundStyle(.red)
                .padding(.horizontal, 20)
                HStack {
                    Spacer()
                    let emailPhase = vm.emailPhase
                    if emailPhase == .none {
                        AlimoButton("인증 요청", type: .Small) {
                            await vm.emailsVerificationRequest()
                        }
                        .padding(.trailing, 10)
                        .frame(height: 50)
                    } else {
                        Text(convertSecondsToTime(timeInSeconds: timeRemaining))
                            .alimoFont(.bodyM)
                            .alimoColor(AlimoColor.Label.em)
                            .onReceive(timer) { _ in
                                if timeRemaining > 0 {
                                    timeRemaining -= 1
                                } else {
                                    vm.emailPhase = .none
                                }
                            }
                            .frame(width: 60, height: 46)
                            .alimoBackground(AlimoColor.Background.normal)
                            .padding(.trailing, 8)
                    }
                }
                .padding(.horizontal, 20)
            }
            
            Spacer()
            
            let isOk = !vm.code.isEmpty
            
            AlimoButton("다음", type: .CTA, isEnabled: isOk) {
                await vm.emailsVerifications { accessToken, refreshToken in
                    tm.accessToken = accessToken
                    tm.refreshToken = refreshToken
                }
            }
            .padding(.horizontal, 20)
            .disabled(!isOk)
            .padding(.bottom, 30)
        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            NavigationUtil.popToRootView()
        })
        .onAppear {
            calcRemain()
        }
        .navigationBarBackButtonHidden()
        .alert(isPresented: $vm.showWrongEmailDialog) {
            Alert(title: Text(vm.emailDialogMessage),
                  dismissButton: .default(Text("닫기")))
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
