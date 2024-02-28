//
//  HomeView.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct BookmarkView: View {
    
    @StateObject var vm: BookmarkViewModel
    
    @State private var scrollViewOffset: CGFloat = 0 {
        didSet {
            if isSelectorReached != (scrollViewOffset >= 84) {
                isSelectorReached = scrollViewOffset >= 84
            }
        }
    }
    @State private var isSelectorReached = false
    var hasPost: Bool = true
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                AlimoLogoBar()
                LazyVStack(spacing: 0) {
                    ForEach(vm.notificationList, id: \.uuidString) { notification in
                        VStack(spacing: 0) {
                            NotificationCeil(notification: notification) {
                                Task {
//                                    await vm.path
                                }
                            }
                            Divider()
                                .foregroundStyle(Color.gray100)
                        }
                        .onAppear {
                            guard let index = vm.notificationList.firstIndex(where: { $0.notificationId == notification.notificationId }) else { return }
                            
                            if index % pagingInterval == (pagingInterval - 1) {
                                
                                Task {
                                    await vm.fetchNotifications(isNew: false)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 100)
            }
            .background(
                GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self,
                                           value: -$0.frame(in: .named("scroll")).origin.y)
                }
            )
            .onPreferenceChange(ViewOffsetKey.self) {
                scrollViewOffset = $0
            }
        }
        .coordinateSpace(name: "scroll")
        .refreshable {
            await vm.fetchNotifications(isNew: true)
        }
    }
}
