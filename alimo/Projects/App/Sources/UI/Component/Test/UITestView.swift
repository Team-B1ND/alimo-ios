//
//  TestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

struct UITestView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    ColorTestView()
                } label: {
                    Text("Color Test")
                }
                NavigationLink {
                    TextTestView()
                } label: {
                    Text("Text Test")
                }
                NavigationLink {
                    ButtonTestView()
                } label: {
                    Text("Button Test")
                }
                NavigationLink {
                    LogoTestView()
                } label: {
                    Text("Logo Test")
                }
                NavigationLink {
                    TextFieldTest()
                } label: {
                    Text("Text Field Test")
                }
                NavigationLink {
                    ToggleTestView()
                } label: {
                    Text("Toggle Test")
                }
                NavigationLink {
                    BadgeTestView()
                } label: {
                    Text("Badge Test")
                }
            }
            .navigationTitle("UI Test")
        }
    }
}
