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
    var new : Bool = true
    var category : [String]
//    @State private var selectedIndex = 0
    @Binding var selectedIndex: Int
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 12) {
                AlimoSmallButton("전체", buttonType: selectedIndex == -1 ? .yellow : .none) {
                    selectedIndex = -1
                }
                .overlay {
                    if new {
                        HStack {
                            Spacer()
                            VStack {
                                AlimoBadge(type: .small)
                                Spacer()
                            }
                        }
                    }
                }
                if category.count > 0 {
                    ForEach(0...category.count, id: \.self) { index in
                        AlimoSmallButton(category[index], buttonType: selectedIndex == index ? .yellow : .none) {
                            selectedIndex = index
                        }
                        .overlay {
                            if new {
                                HStack {
                                    Spacer()
                                    VStack {
                                        AlimoBadge(type: .small)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }//foreach
                }
            }//hs
            .frame(maxWidth: .infinity, minHeight: 26)
        }//스크롤
        .padding(.horizontal, 16)
    }
}

