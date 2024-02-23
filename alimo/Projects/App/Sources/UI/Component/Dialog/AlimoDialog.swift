//
//  AlimoDialog.swift
//  App
//
//  Created by dgsw8th36 on 1/31/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct AlimoDialog<C>: View where C: View {
    
    @EnvironmentObject var dm: DialogManager
    @Binding var showDialog: Bool {
        didSet {
            if showDialog {
                dm.phase = .show
            } else {
                dm.phase = .none
            }
        }
    }
    
    let title: String
    let description: String
    let content: () -> C
    
    init(showDialog: Binding<Bool>,
         title: String,
         description: String,
         content: @escaping (() -> C) = { EmptyView() }) {
        self._showDialog = showDialog
        self.title = title
        self.description = description
        self.content = content
    }
    
    var body: some View {
        if showDialog {
            VStack(spacing: 16) {
                Text("\(title)")
                    .font(.subtitle)
                
                Text("\(description)")
                    .font(.bodyLight)
                    .foregroundStyle(Color.gray500)
                
                content()
            }
            .padding(.horizontal, 12)
            .frame(minWidth: 260, maxWidth: 320)
            .padding(.vertical, 24)
            .background(Color.white)
            .clipShape(RoundedCorner(radius: Size.normal.rawValue))
        }
    }
}
