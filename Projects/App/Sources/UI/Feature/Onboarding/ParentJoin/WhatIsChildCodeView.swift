//
//  WhatIsChildCodeView.swift
//  App
//
//  Created by dgsw8th36 on 4/17/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI
import ADS

struct WhatIsChildCodeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
            AlimoWebView(url: URL(string: "https://subsequent-grouse.super.site/")!)
                .navigationBarBackButtonHidden()
                .alimoBackground(AlimoColor.Background.normal)
                .alimoTopAppBar("로그인", background: AlimoColor.Background.normal, backButtonAction:  {
                    dismiss()
                })
    }
}
