//
//  Icons.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Icons : View {
    @State var isButtonPressed = false
    
    var body: some View {
        HStack(spacing : 10){
            Button {
            } label: {
                CustomImage(name: "AddImoji")
            }
            NavigationLink(destination: DetailPostView()) {
                CustomImage(name: "Chat")
            }
            
            Spacer()
            
            Button {
                isButtonPressed.toggle()
            } label: {
                if isButtonPressed {
                    Image("VectorYellow")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 13, height: 13)
                } else {
                    Image("VectorWhite")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 13, height: 13)
                }
            }
        }
    }
    
    func CustomImage(name: String) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 25, height: 25)
            .opacity(0.3)
    }
}



#Preview {
    Icons()
}
