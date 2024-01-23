//
//  Reply.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//


import Foundation
import SwiftUI

struct Reply : View {
    var body: some View {
            HStack{
                Image("Line")
                Comment()
                    .padding(.top,55)
                    .offset(x:-15)
            }
    }
}

#Preview {
    Reply()
}
