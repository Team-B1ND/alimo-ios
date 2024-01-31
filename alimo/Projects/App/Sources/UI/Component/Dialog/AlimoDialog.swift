//
//  AlimoDialog.swift
//  App
//
//  Created by dgsw8th36 on 1/31/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct AlimoDialog: View {
    
    @Binding var showDialog: Bool
    
    let title: String
    let content: String
    let buttonText: String
    
    var body: some View {
        Rectangle()
            .opacity(0.3)
            .ignoresSafeArea()
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.white)
                    .frame(width: 290, height: 160)
                    .overlay {
                        VStack {
                            Text("\(title)")
                                .font(.subtitle)
                                .padding(.bottom, 7)
                            
                            Text("\(content)")
                                .font(.bodyLight)
                                .foregroundStyle(Color.gray500)
                                .padding(.bottom, 8)
                            
                            HStack {
                                Spacer()
                                
                                Button {
                                    showDialog = false
                                } label: {
                                    Text("\(buttonText)")
                                        .foregroundStyle(Color.gray500)
                                        .frame(width: 50, height: 40)
                                        .background(Color.gray100)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                }
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 5)
                            
                        }
                    }
                    .padding(.bottom, 100)
            }
    }
}
