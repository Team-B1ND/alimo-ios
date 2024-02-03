//
//  DetailPostView.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailPostView : View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            ZStack {
                ScrollView (showsIndicators: false){
                    VStack(spacing: 0) {
                        DetailPost()
                        Divider()
                        Emoji()
                            .padding(.top, 16)
                        LazyVStack {
                            ForEach(0..<3) { i in
                                Comment()
                                    .padding(.leading, 12)
                            }
                        }
                        .padding(.top, 16)
                        Rectangle()
                            .padding(.top, 24)
                            .foregroundStyle(Color.gray100)
                            .frame(maxWidth: .infinity)
                            .frame(height: 108)
                    }
                }
                VStack {
                    Spacer()
                    Textfield()
                }
                .ignoresSafeArea()
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden()
            .navigationBarItems(leading: Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            })
    }
}

#Preview {
    DetailPostView()
}
