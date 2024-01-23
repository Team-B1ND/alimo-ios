//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Post: View {
    var body: some View {
        VStack(alignment : .leading){
            Profile()
            Contents()
            Icons()
            Divider()
    
        }//vs
        .padding(.horizontal,20)
    }
}


#Preview {
    Post()
}
