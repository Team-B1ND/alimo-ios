//
//  PrivacyPolicyView.swift
//  App
//
//  Created by dgsw8th36 on 4/17/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct PrivacyPolicyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        AlimoWebView(url: URL(string: "https://ahead-yacht-97a.notion.site/215ee2a6510e4cff92cff58f7c5011de")!)
            .navigationBarBackButtonHidden()
            .alimoToolbar("") {
                dismiss()
            }
    }
}
