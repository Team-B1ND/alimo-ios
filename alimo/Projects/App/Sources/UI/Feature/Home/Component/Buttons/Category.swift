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
    var new : Bool = false
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 10) {
                AlimoSmallButton(dummyText, buttonType: .yellow) {
                    print(dummyText)
                }
                .overlay{
                    if new {
                        Circle()
                            .frame(width: 10,height: 10)
                            .foregroundColor(.red500)
                            .padding(.leading,55)
                            .padding(.bottom,25)
                    }
                   
                }
                ForEach(1...3, id: \.self) { _ in
                    AlimoSmallButton(dummyText, buttonType: .none) {
                        print(dummyText)
                    }
                    .overlay{
                        if new {
                            Circle()
                                .frame(width: 10,height: 10)
                                .foregroundColor(.red500)
                                .padding(.leading,55)
                                .padding(.bottom,25)
                        }
                    }
                }//foreach
            }//hs
            .frame(maxWidth: .infinity,minHeight: 35)
        }//스크롤
        .padding(20)
    }
}

#Preview {
    Category()
}

