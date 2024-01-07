//
//  Profile.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Profile : View {
    var body: some View {
        HStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(dummyText)
                .font(.bodyLight)
                
            //그냥 body 하면 에러남 고치기 이름
            Text(dummyText)
                .font(.cute)
                .opacity(0.5)
                .padding(.top,3)
            
        }//hs
        
    }
}

#Preview {
    Profile()
}

