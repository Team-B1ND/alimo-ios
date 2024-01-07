//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Morebutton : View {
    var body: some View {
        Button(action: {
            
        }, label: {
            Text("...더보기")
                .font(.cute)
                .foregroundColor(.gray500)
                .padding(.top,3)
        })
     
            

        
    }
}

#Preview {
    Morebutton()
}
