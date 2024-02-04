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
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    AlimoLogoBar()
                    Notice()
                    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                        Section(header: filterBar) {
                            if hasNotice {
                                ForEach(1...3, id: \.self) { _ in
                                    VStack(spacing: 0) {
                                        Post()
                                        Divider()
                                            .foregroundStyle(Color.gray100)
                                    }
                                }
                            } else {
                                Image(AppAsset.Assets.noNotice.name)
                                    .padding(.top, 115)
                                Text("공지를 불러올 수 없어요")
                                    .font(.subtitle)
                                    .foregroundStyle(Color.gray500)
                                    .padding(.top, 32)
                            }
                        }
                    }
                }
            }
            .clipped()
        }
    }
}
private var filterBar: some View {
    Category()
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white)
}


#Preview {
    HomeView()
}
