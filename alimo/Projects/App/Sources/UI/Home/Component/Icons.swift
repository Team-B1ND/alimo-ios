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
                Image("AddImoji")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 30)
                    .opacity(0.5)
            }
            
            Button {
                //
            } label: {
                Image("Chat")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 30)
                    .opacity(0.5)
            }
            
            Spacer()
            
            Button{
                //
            } label: {
                Image("BookMark")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 32, height: 30)
                    .opacity(0.5)
                // 이거 북마크 빈 이미지 수정
                  
            }
        }//hs
        .padding(.horizontal,20)
        
    }
}

#Preview {
    Icons()
}
