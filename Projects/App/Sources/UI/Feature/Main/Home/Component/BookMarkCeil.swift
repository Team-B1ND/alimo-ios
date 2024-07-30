//
//  BookMarkCeil.swift
//  App
//
//  Created by dgsw8th61 on 7/30/24.
//  Copyright © 2024 b1nd. All rights reserved.
//

import SwiftUI
import ADS

struct BookMarkCeil: View {
    var notification: Notification
    var onClickEmoji: (EmojiType) -> Void
    var onClickBookmark: () -> Void
    @State var showDialog = false
    @StateObject var vm: NotificationDetailViewModel
    @StateObject var homeVm: HomeViewModel
    @StateObject var bookMarkVm: BookmarkViewModel
    @EnvironmentObject var downloadManager: DownloadManager
    @State private var matchedCategories:  [[String]] = []
    @State private var callCount: Int
    
    init(notification: Notification,
         onClickEmoji: @escaping (EmojiType) -> Void,
         onClickBookmark: @escaping () -> Void,
         vm:NotificationDetailViewModel,
         homeVm: HomeViewModel,
         bookMarkVm: BookmarkViewModel,
         callCount: Int
    ) {
        self.notification = notification
        self.onClickEmoji = onClickEmoji
        self.onClickBookmark = onClickBookmark
        self._vm = StateObject(wrappedValue: vm)
        self._homeVm = StateObject(wrappedValue: homeVm)
        self._bookMarkVm = StateObject(wrappedValue: bookMarkVm)
        self.callCount = callCount
    }
    var body: some View {
        HStack(spacing: 0) {
            let categoryToShow = callCount < matchedCategories.count ? matchedCategories[callCount] : []
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink {
                    NotificationDetailView(vm: NotificationDetailViewModel(notificationId: notification.notificationId), homeVm: HomeViewModel(), onClickBookmark: {
                        Task {
                            await vm.patchBookmark()
                        }
                    }, onClickEmoji: { emoji in
                        Task {
                            await homeVm.patchEmoji(emoji: emoji, notificationId: notification.notificationId)
                        }
                    })
                } label: {
                    HStack(alignment: .top) {
                        AlimoBookMark(isSelected: notification.isBookMarked,
                                      bookmarkAction: {onClickBookmark()},
                                      title: notification.title,
                                      content: notification.content,
                                      date: notification.createdAt,
                                      category: categoryToShow)
                    }
                }
            }
        }
        .padding(.leading, 12)
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
        .task {
            await vm.fetchNotification()
            await homeVm.fetchCategoryList()
            await fetchCategories()
        }
    }
    private func fetchCategories() async {
        
        for category in homeVm.category {
            await bookMarkVm.fetchNotifications(isNew: true, category: category)
            
            for notification in bookMarkVm.notificationList {
                if self.notification.notificationId == notification.notificationId {
                    let categoryArray = [category]
                    if !matchedCategories.contains(where: { $0.first == category }) {
                        matchedCategories.append(categoryArray)
                    }
                }
            }
        }
    }

}
