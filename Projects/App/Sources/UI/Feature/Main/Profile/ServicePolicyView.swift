//
//  ServicePolicyView.swift
//  App
//
//  Created by dgsw8th36 on 4/17/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ServicePolicyView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        AlimoWebView(url: URL(string: "https://ahead-yacht-97a.notion.site/e9ae676d8ecd4a9a921400ceea6c27e3")!)
            .navigationBarBackButtonHidden()
            .alimoToolbar("") {
                dismiss()
            }
    }
}
