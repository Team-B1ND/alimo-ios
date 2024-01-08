//
//  HomeView.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct BookMarkView: View {
    var hasPost: Bool = false // 게시물 유무를 나타내는 변수
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    AlimoLogo(type: .gray)
                        .padding(.leading,20)
                    Spacer()
                }
                
                if hasPost {
                    Post()
                        .padding(.top,10)
                } else {
                    Image("NoBookMark")
                        .padding(.top,200)
                }
                
            }// VStack
        }// ScrollView
    }
}




#Preview {
    BookMarkView()
}
