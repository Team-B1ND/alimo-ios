//
//  HomeView.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Category()
            ScrollView(.vertical, showsIndicators: true) {
                
            }//scroll
            
        }//vs
    }
}

#Preview {
    HomeView()
}
