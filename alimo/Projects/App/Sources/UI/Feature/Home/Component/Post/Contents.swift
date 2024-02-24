//
//  Contents.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Contents: View {
    var content : String 
    var body: some View {
        Text(content)
            .lineLimit(6)
            .font(.caption)
            .foregroundColor(.main900)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .lineSpacing(5)
    }
}


