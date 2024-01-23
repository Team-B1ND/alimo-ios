//
//  Notice.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Notice : View {
    var body : some View{
        ZStack{
            Rectangle()
                .foregroundColor(.main100)
                .frame(width: 360, height: 35)
                .cornerRadius(5)
            HStack{
                Image("Speaker")
                
                Text("불러오는중...")
                    .font(.label)
                    .foregroundColor(.main900)
                Text("· 작성자")
                    .font(.label)
                    .foregroundColor(.gray500)
                Spacer()
            }
            .padding(.horizontal,30)
            
               
        }
        
    }
}

#Preview {
    Notice()
}
