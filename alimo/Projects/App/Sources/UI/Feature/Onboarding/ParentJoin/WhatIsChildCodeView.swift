//
//  WhatIsChildCodeView.swift
//  App
//
//  Created by dgsw8th36 on 4/17/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct WhatIsChildCodeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
            AlimoWebView(url: URL(string: "https://subsequent-grouse.super.site/")!)
                .navigationBarBackButtonHidden()
                .alimoToolbar("") {
                    dismiss()
                }
    }
}
