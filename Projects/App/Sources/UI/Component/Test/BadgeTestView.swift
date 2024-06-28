//
//  BadgeTestView.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct BadgeTestView: View {
    var body: some View {
        VStack {
            AlimoBadge(type: .large)
            AlimoBadge(type: .medium)
            AlimoBadge(type: .small)
        }
    }
}
