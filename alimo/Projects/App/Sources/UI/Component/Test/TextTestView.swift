//
//  TextTestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct TextTestView: View {
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(dummyText)
                    .font(.title)
                Text(dummyText)
                    .font(.subtitle)
                Text(dummyText)
                    .font(.body)
                Text(dummyText)
                    .font(.bodyLight)
                Text(dummyText)
                    .font(.label)
                Text(dummyText)
                    .font(.caption)
                Text(dummyText)
                    .font(.cute)
                Spacer()
            }
            .padding(.leading, 10)
            Spacer()
        }
    }
}
