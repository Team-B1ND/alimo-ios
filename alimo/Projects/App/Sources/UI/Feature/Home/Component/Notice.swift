//
//  Notice.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct Notice : View {
    @ObservedObject var homeViewModel = HomeViewModel()
    var body : some View{
        ZStack {
            Rectangle()
                .foregroundColor(.main100)
                .frame(maxWidth: .infinity, minHeight: 36)
                .cornerRadius(5)
            HStack {
                Image(Asset.loudSpeaker)
                    .renderingMode(.template)
                    .foregroundStyle(Color.main300)
                Text(homeViewModel.notificationspeaketitle)
                    .font(.label)
                    .foregroundColor(.main900)
                Text("· \(homeViewModel.memberID ?? 0)")
                    .font(.label)
                    .foregroundColor(.gray500)
                Spacer()
            }
            .padding(.horizontal, 8)
        }
        .onAppear{
            Task { 
                await homeViewModel.notificationspeake()
            }

        }
        .padding(.horizontal, 6)
    }
}

#Preview {
    Notice()
}
