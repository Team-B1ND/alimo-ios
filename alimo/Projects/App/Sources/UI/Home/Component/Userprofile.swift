//
//  Userprofile.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Userprofile : View {
    var body: some View {
        HStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(dummyText)
                .font(.bodyLight)
                
   
            
        }//hs
        
    }
}

#Preview {
    Userprofile()
}

