//
//  Notice.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Notice : View {
    var body : some View{
        ZStack {
            Rectangle()
                .foregroundColor(.main100)
                .frame(maxWidth: .infinity, minHeight: 36)
                .cornerRadius(5)
            HStack {
                Image(Asset.loudSpeaker)
                    .renderingMode(.template)
                    .foregroundStyle(Color.main300)
                Text("불러오는중...")
                    .font(.label)
                    .foregroundColor(.main900)
                Text("· 작성자")
                    .font(.label)
                    .foregroundColor(.gray500)
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .padding(.horizontal, 6)
    }
}

#Preview {
    Notice()
}
