//
//  Testview.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct ColorTestView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                HStack(spacing: 0) {
                    ColorCeil(.main50)
                    ColorCeil(.main100)
                    ColorCeil(.main200)
                    ColorCeil(.main300)
                    ColorCeil(.main400)
                    ColorCeil(.main500)
                    ColorCeil(.main600)
                    ColorCeil(.main700)
                    ColorCeil(.main800)
                    ColorCeil(.main900)
                }
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding(.horizontal, 10)
                
                HStack(spacing: 0) {
                    ColorCeil(.gray100)
                    ColorCeil(.gray300)
                    ColorCeil(.gray500)
                    ColorCeil(.gray700)
                }
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding(.horizontal, 10)
            }
            
        }
    }
}

struct ColorCeil: View {
    
    let color: Color
    
    init(_ color: Color) {
        self.color = color
    }
    
    var body: some View {
        Rectangle().frame(height: 160).foregroundStyle(color)
    }
}

#Preview {
    ColorTestView()
}
