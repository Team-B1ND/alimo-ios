//
//  Reply.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//


import Foundation
import SwiftUI

struct Textfield: View {
    @State private var commentText: String = ""
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: .infinity, height: 75)
                .cornerRadius(5)
                .shadow(color: .gray300, radius: 3, x: 0, y: -3)
            
            TextField("댓글을 남겨보세요", text: $commentText)
                .padding(.bottom,20)
                .padding(.leading,25)
            HStack{
                Spacer()
                Button(action: {
                    //댓글 보내기 
                }, label: {
                    Image("Send")
                        
                })
                .padding(.bottom,20)
                .padding(.trailing,25)
            }
        }
    }
}

