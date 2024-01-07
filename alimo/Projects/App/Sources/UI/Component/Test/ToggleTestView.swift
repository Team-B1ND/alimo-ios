//
//  ToggleTestView.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

struct ToggleTestView: View {
    
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            AlimoToggle(isOn: $isOn)
                
        }
    }
}
