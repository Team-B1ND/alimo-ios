//
//  Icons.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Icons : View {
    var body: some View {
        HStack(spacing : 10){
            Button {
                //
            } label: {
                CustomImage(name: "AddImoji")
            }
            
            Button {
                //
            } label: {
                CustomImage(name: "Chat")
            }
            
            Spacer()
            
            Button{
                //
            } label: {
                CustomImage(name: "BookMark")
                // 이거 북마크 빈 이미지 수정
                  
            }
        }//hs
        .padding(.horizontal,20)
        
    }
    func CustomImage(name: String) -> some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 32, height: 30)
            .opacity(0.5)
    }
}

#Preview {
    Icons()
}
