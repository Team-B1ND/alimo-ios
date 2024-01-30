//
//  Profile.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Profile : View {
    @State var Newpost : Bool = true
    var body: some View {
        HStack{
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("작성자")
                .font(.system(size: 16))
                .foregroundColor(.main900)
                .bold()
            
            Text("2023년 1월 1일 오후 11:1")
                .font(.cute)
                .foregroundColor(.gray500)
                .padding(.top,3)
            
            if Newpost {
                Image("New")
                    .frame(width: 5,height: 5)
                    .padding(.horizontal,5)
            }
        }//hs
    }
}

#Preview {
    Profile()
}

