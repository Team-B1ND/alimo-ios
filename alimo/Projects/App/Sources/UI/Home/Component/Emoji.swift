//
//  Emoji.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Emoji : View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.1)
                .frame(width: 300,height: 35)
                .cornerRadius(5)
            
            HStack{
                Image("Ok")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 20,height: 20)
                 .cornerRadius(5)
            }//hs
        }//zs
        
    }
}

#Preview {
    Emoji()
}
