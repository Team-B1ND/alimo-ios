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
        NavigationView{
            ZStack(alignment: .top) {
                TabView(selection: $selectedIndex) {
                    HomeView()
                        .tabItem {
                            VStack {
                                if selectedIndex == 0{
                                    Image("Home")
                                }else{
                                    Image("Home_none")
                                }
                                Text("홈")
                                    .font(.cute)
                                    .padding(.top, 1)
                            }
                        }
                        .tag(0)
                        .onTapGesture {
                            selectedIndex = 0
                            print(selectedIndex)
                        }
                    
                    BookMarkView()
                        .tabItem {
                            VStack {
                           
                                if selectedIndex == 1{
                                    Image("BookMark")
                                       
                                }
                                else{
                                    Image("BookMark_none")
                                }
                                
                                Text("북마크")
                                    .font(.cute)
                                    .padding(.top, 2)
                            }
                        }
                        .tag(1)
                        .onTapGesture {
                            selectedIndex = 1
                            print(selectedIndex)
                        }
                    
                    Text("Ssalbab")
                        .tabItem {
                            VStack {
                                if selectedIndex == 2{
                                    Image("Profile")
                                }else{
                                    Image("Profile_none")
                                }
                                Text("MY")
                                    .font(.cute)
                                    .padding(.top, 2)
                            }
                        }
                        .tag(2)
                        .onTapGesture {
                            selectedIndex = 2
                            print(selectedIndex)
                        }
                }
                
                .accentColor(.black)
                .onAppear {
                            UITabBar.appearance().backgroundColor = .white
                        }
                
                //            Rectangle()
                //                .frame(height: 0.2)
                //                .foregroundColor(.gray)
                //                .shadow(radius: 5)
                //                .offset(y: 690)
            }
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    Tabbar()
}
