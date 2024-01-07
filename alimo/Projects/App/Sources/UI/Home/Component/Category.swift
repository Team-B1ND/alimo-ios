//
//  Category.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Category : View {
    var body: some View {
      
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 10) {
                AlimoSmallButton(dummyText, buttonType: .yellow) {
                    print(dummyText)
                }
                AlimoSmallButton(dummyText, buttonType: .none) {
                    print(dummyText)
                }
            }//hs
        }//스크롤
        .padding(20)


        
    }
}

#Preview {
    Category()
}

