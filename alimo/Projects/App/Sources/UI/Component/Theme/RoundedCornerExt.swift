//
//  RoundedCornerExt.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//


import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
