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
    var notice : Bool = true
    var body: some View {
//        NavigationView{
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
                                ForEach(1...3, id: \.self) { name in
                                    Post()
                                        .padding(.bottom,30)
                                }
                            }
                            
                        }
                    }
                }
                else{
                    Image("NoNotice")
                        .padding(.top,200)
                }
            }
            .clipped()
//        }
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
