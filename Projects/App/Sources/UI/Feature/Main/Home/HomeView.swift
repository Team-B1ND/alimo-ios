//
//  HomeView.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI
import ADS

struct HomeView: View {
    
    @ObservedObject var vm: HomeViewModel
    @EnvironmentObject var tm: TokenManager
    @State var reader: ScrollViewProxy?
    
    @State private var scrollViewOffset: CGFloat = 0 {
        didSet {
            if isSelectorReached != (scrollViewOffset >= 84) {
                isSelectorReached = scrollViewOffset >= 84
            }
        }
    }
    @State private var isSelectorReached = false
    
    @ViewBuilder
    private var categorySelector: some View {
        let category = vm.category
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
//                AlimoSmallButton("전체", buttonType: vm.selectedIndex == -1 ? .yellow : .none) {
//                    vm.selectedIndex = -1
//                    withAnimation {
//                        reader?.scrollTo("top")
//                    }
//                }
//                ForEach(0..<category.count, id: \.self) { index in
//                    AlimoSmallButton(category[index], buttonType: vm.selectedIndex == index ? .yellow : .none) {
//                        vm.selectedIndex = index
//                        withAnimation {
//                            reader?.scrollTo("top")
//                        }
//                    }
//                }
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .alimoBackground(AlimoColor.Background.normal)
        .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
        .showShadow(show: isSelectorReached)
    }
    
    var body: some View {
        ZStack{
            ScrollViewReader { reader in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
//                        AlimoLogoBar()
//                            .id("top")
                        if let loudSpeaker = vm.loudSpeaker {
                            Notice(vm: NotificationDetailViewModel(notificationId: loudSpeaker.notificationId),homeVm: HomeViewModel(), notificationspeaketitle: Text(loudSpeaker.title), memberID: Text(loudSpeaker.name), notificationId: loudSpeaker.notificationId)
                        }
                        
                        LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                            Section(header: categorySelector) {
                                switch vm.flow {
                                case .fetching:
                                    LazyVStack(spacing: 0) {
                                        ForEach(0..<4, id: \.self) { _ in
                                            NotificationCellShimmer()
                                        }
                                    }
                                case .success:
                                    LazyVStack(spacing: 0) {
                                        ForEach(vm.notificationList, id: \.uuidString) { notification in
                                            VStack(spacing: 0) {
                                                NotificationCeil(notification: notification, onClickEmoji: { emoji in
                                                    Task {
                                                        await vm.patchEmoji(emoji: emoji, notificationId: notification.notificationId)
                                                    }
                                                }, onClickBookmark: {
                                                    Task {
                                                        await vm.patchBookmark(notificationId: notification.notificationId)
                                                    }
                                                }, vm: NotificationDetailViewModel(notificationId: notification.notificationId), homeVm: HomeViewModel())
                                                AlimoDivider()
                                            }
                                            .task {
                                                guard let index = vm.notificationList.firstIndex(where: { $0.notificationId == notification.notificationId }) else { return }
                                                
                                                if index % pagingInterval == (pagingInterval - 1) && index / pagingInterval == (vm.notificationList.count - 1) / pagingInterval {
                                                    await vm.fetchNotifications(isNew: false)
                                                }
                                            }
                                        }
                                    }
                                    .lineLimit(3)
                                    .padding(.bottom, 100)
                                case .failure:
//                                    Image(.noNotice)
//                                        .padding(.top, 115)
                                    Text("공지를 불러올 수 없어요")
//                                        .font(.subtitle) // TODO: fix font
//                                        .foregroundStyle(Color.gray500)
                                        .padding(.top, 32)
                                }
                            }
                        }
                        .shimmer(vm.flow == .fetching)
                    }
                }
                .alimoBackground(AlimoColor.Background.normal)
                .background(
                    GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.y)
                    }
                )
                .onPreferenceChange(ViewOffsetKey.self) {
                    scrollViewOffset = $0
                }
                .onAppear {
                    self.reader = reader
                }
            }
            .coordinateSpace(name: "scroll")
            .refreshable {
                Task {
                    vm.flow = .fetching
                    await vm.fetchNotifications(isNew: true)
                }
            }
            .task {
                vm.flow = .fetching
                
                await withTaskGroup(of: Void.self) { group in
                    group.addTask {
                        await vm.fetchCategoryList()
                    }
                    group.addTask {
                        await vm.fetchLoudSpeaker()
                    }
                    group.addTask {
                        await vm.fetchNotifications(isNew: true)
                    }
                }
            }
        }
        .onChange(of: vm.refreshFailure) {
            if $0 {
                tm.accessToken = ""
                tm.refreshToken = ""
            }
        }
    }
}
