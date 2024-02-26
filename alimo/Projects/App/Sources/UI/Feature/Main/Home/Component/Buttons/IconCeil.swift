//
//  Icons.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct IconCeil: View {
    
    @State var isButtonPressed = false
    
    var body: some View {
        HStack(spacing: 8) {
            Button {
                
            } label: {
                PostIcon("AddImoji")
            }
            NavigationLink(destination: NotificationDetailView()) {
                PostIcon("Chat")
            }
            
            Spacer()
            
            Button {
                isButtonPressed.toggle()
            } label: {
                Image(isButtonPressed ? AppAsset.Assets.clickedBookmark.name : AppAsset.Assets.bookmark.name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
            }
        }
    }
    
    private func PostIcon(_ name: String) -> some View {
        Image(name)
            .resizable()
            .renderingMode(.template)
            .foregroundStyle(Color.gray500)
            .frame(width: 24, height: 24)
    }
}



#Preview {
    IconCeil()
}
