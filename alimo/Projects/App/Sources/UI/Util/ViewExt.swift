//
//  ViewExt.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

extension View {
    func alimoToolbar(_ title: String,
                      onClick: @escaping () -> Void) -> some View {
        self.toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    Button {
                        onClick()
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(.black)
                    }
                    
                    Text(title)
                        .font(.subtitle)
                        .foregroundStyle(Color.main900)
                }
            }
        }
    }
}
