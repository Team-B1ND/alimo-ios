//
//  DetailPostView.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailPostView : View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ZStack {
                ScrollView (showsIndicators : false){
                    VStack {
                        DetailPost()
                        Comment()
                    }
                    .padding(.bottom,60)
                }
                VStack {
                    Spacer()
                    Textfield()
                }
                .ignoresSafeArea()
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(.black)
            })
    }
}

#Preview {
    DetailPostView()
}
