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
    var hasPost: Bool = true // 게시물 유무를 나타내는 변수
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators : false) {
                VStack{
                    AlimoLogoBar()
                    
                    if hasPost {
                        ForEach(1...3, id: \.self) { _ in
                            NavigationLink(destination: DetailPostView()) {
                                Post()
                            }
                            .padding(.bottom,30)
                        }

                            .padding(.top,10)
                    } else {
                        Image("NoBookMark")
                            .padding(.top,200)
                        
                        Text("아직 북마크가 없어요")
                            .font(.subtitle)
                            .bold()
                            .foregroundColor(.gray500)
                            .padding(.vertical,20)
                    }
                    
                }// VStack
            }// ScrollView
        }
    }
}

#Preview {
    BookMarkView()
}
