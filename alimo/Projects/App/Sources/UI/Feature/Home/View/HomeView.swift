//
//  HomeView.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var notice : Bool = false
    var body: some View {
        NavigationView{
        ScrollView(showsIndicators : false) {
                ZStack {
                    //로고
                    HStack{
                        AlimoLogo(type: .gray)
                            .padding(.leading,20)
                        Spacer()
                        
                    }
                    //
                    
                }
                Notice()
                
                if notice {
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section(header: filterBar) {
                            VStack {
                                ForEach(1...3, id: \.self) { _ in
                                    
                                    NavigationLink(destination: DetailPostView()) {
                                        
                                        Post()
                                    }
                                    
                                    
                                 
                                        .padding(.bottom,30)
                                }
                            }
                            
                        }
                    }
                }
                else{
                    LazyVStack(pinnedViews: [.sectionHeaders]) {
                        Section(header: filterBar) {
                            VStack{
                                Spacer()
                                Image("NoNotice")
                                    .padding(.top,100)
                                Text("공지를 불러올 수 없어요")
                                    .font(.subtitle)
                                    .bold()
                                    .foregroundColor(.gray500)
                                    .padding(.vertical,20)
                                Spacer()
                            }
                            
                               
                        }
                    }

                }
            }
            .clipped()
        }
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)

        
    }
    
}
private var filterBar: some View {
    HStack {
        VStack {
            Category()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 60)
        .background(Rectangle().foregroundColor(.white))
        
    }
  
}


#Preview {
    HomeView()
}
