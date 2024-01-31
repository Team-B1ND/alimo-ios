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
    var hasNotice: Bool = true
    var body: some View {
//        NavigationView {
            ScrollView(showsIndicators: false) {
                ZStack {
                    HStack {
                        AlimoLogo(type: .gray)
                            .padding(.leading, 20)
                        Spacer()
                    }
                }
                Notice()
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    Section(header: filterBar) {
                        VStack {
                            if hasNotice {
                                ForEach(1...3, id: \.self) { _ in
                                    NavigationLink(destination: DetailPostView()) {
                                        Post()
                                    }
                                    .padding(.bottom,30)
                                }
                            } else {
                                Spacer()
                                Image("NoNotice")
                                    .padding(.top,100)
                                Text("공지를 불러올 수 없어요")
                                    .font(.subtitle)
                                    .foregroundStyle(Color.gray500)
                                    .padding(.vertical,20)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .clipped()
        }
    }
//}
private var filterBar: some View {
    Category()
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white)
}


#Preview {
    HomeView()
}
