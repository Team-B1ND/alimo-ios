//
//  ParentFindPWFirstView.swift
//  App
//
//  Created by dgsw8th36 on 1/11/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct ParentFindPWFirstView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var vm: ParentFindPWViewModel = ParentFindPWViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("계정의 이메일을 알려주세요")
                    .alimoFont(.headline1B)
                    .alimoColor(AlimoColor.Label.normal)
                    .padding(.top, 16)
                    .padding(.bottom, 10)
                    .padding(.leading, 24)
                Spacer()
            }
            
            AlimoTextField("이메일을 입력해 주세요", text: $vm.email)
                .padding(.horizontal, 20)
                        
            Spacer()
            
            let isOk = !vm.email.isEmpty
            
            NavigationLink(isActive: $vm.isEmailNotEmpty) {
                ParentFindPWSecondView()
            } label: {}
            
            AlimoButton("다음", type: .CTA, isEnabled: isOk) {
                vm.CheckEmailNotEmpty()
            }
            .padding(.horizontal, 20)
            .disabled(!isOk)
            .padding(.bottom, 30)

        }
        .alimoBackground(AlimoColor.Background.normal)
        .alimoTopAppBar("회원가입", background: AlimoColor.Background.normal, backButtonAction:  {
            dismiss()
        })
        .navigationBarBackButtonHidden(true)
    }
}
