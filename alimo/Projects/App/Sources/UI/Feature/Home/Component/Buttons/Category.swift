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
    @State private var selectedIndex = 0
    @ObservedObject var homeViewModel = HomeViewModel()
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 12) {
                AlimoSmallButton("전체", buttonType: selectedIndex == 0 ? .yellow : .none) {
                    selectedIndex = 0
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
//                ForEach(1...homeViewModel.category.count, id: \.self) { index in
                ForEach(1...3, id: \.self) { index in 
                    AlimoSmallButton(dummyText, buttonType: selectedIndex == index ? .yellow : .none) {
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
            }//hs
            .frame(maxWidth: .infinity, minHeight: 26)
        }//스크롤
        .padding(.horizontal, 16)
    }
}

#Preview {
    Category()
}

