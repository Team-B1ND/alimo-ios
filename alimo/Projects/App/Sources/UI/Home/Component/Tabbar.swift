//
//  Notice.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//


import SwiftUI

struct Tabbar: View {
    @State private var selectedIndex = 0
    
    init() {
    UITabBar.appearance().backgroundColor = UIColor.white

    }
    
    var body: some View {
        ZStack(alignment: .top) {
            
            TabView(selection: $selectedIndex) {
                HomeView()
                    .tabItem {
                        VStack {
                            Image("Home")
                                .opacity(selectedIndex == 0 ? 1 : 0.5)
                            
                            Text("홈")
                                .font(.cute)
                                .padding(.top, 1)
                        }
                    }
                    .tag(0)
                    .onTapGesture {
                        selectedIndex = 0
                    }
                
                BookMarkView()
                    .tabItem {
                        VStack {
                            Image("BookMark")
                                .opacity(selectedIndex == 1 ? 1 : 0.5)
                            
                            Text("북마크")
                                .font(.cute)
                                .padding(.top, 2)
                        }
                    }
                    .tag(1)
                    .onTapGesture {
                        selectedIndex = 1
                    }
                
                Text("Ssalbab")
                    .tabItem {
                        VStack {
                            Image("Profile")
                                .opacity(selectedIndex == 2 ? 1 : 0.5)
                             
                            
                            Text("MY")
                                .font(.cute)
                                .padding(.top, 2)
                        }
                    }
                    .tag(2)
                    .onTapGesture {
                        selectedIndex = 2
                    }
            }

            .accentColor(.black)
            
//            Rectangle()
//                .frame(height: 0.2)
//                .foregroundColor(.gray)
//                .shadow(radius: 5)
//                .offset(y: 690)
        }
    }
}

#Preview {
    Tabbar()
}
