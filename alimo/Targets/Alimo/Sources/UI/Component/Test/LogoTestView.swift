//
//  LogoTestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct LogoTestView: View {
    var body: some View {
        VStack {
            AlimoLogo(type: .white)
                .padding()
                .background(Color.main500)
            AlimoLogo(type: .yellow)
                .padding()
            AlimoLogo(type: .gray)
                .padding()
        }
    }
}
