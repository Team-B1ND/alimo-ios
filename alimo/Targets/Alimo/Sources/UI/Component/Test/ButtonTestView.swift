//
//  ButtonTestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct ButtonTestView: View {
    var body: some View {
        VStack(spacing: 10) {
            AlimoButton(dummyText, buttonType: .yellow) {
                print(dummyText)
            }
            
            AlimoButton(dummyText, buttonType: .black) {
                print(dummyText)
            }
            
            AlimoButton(dummyText, buttonType: .red) {
                print(dummyText)
            }
            
            AlimoButton(dummyText, buttonType: .none) {
                print(dummyText)
            }
            
            AlimoSmallButton(dummyText, buttonType: .yellow) {
                print(dummyText)
            }
            
            AlimoSmallButton(dummyText, buttonType: .black) {
                print(dummyText)
            }
            
            AlimoSmallButton(dummyText, buttonType: .red) {
                print(dummyText)
            }
            
            AlimoSmallButton(dummyText, buttonType: .none) {
                print(dummyText)
            }
        }
    }
}
