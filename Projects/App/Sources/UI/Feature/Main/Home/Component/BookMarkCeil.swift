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
    @StateObject var bookMarkVm: BookmarkViewModel
    @EnvironmentObject var downloadManager: DownloadManager
    @Binding private var matchedCategories:  [[String]]
    @State private var callCount: Int
    @State var category : [String]
    
    
    init(notification: Notification,
         onClickEmoji: @escaping (EmojiType) -> Void,
         onClickBookmark: @escaping () -> Void,
         vm:NotificationDetailViewModel,
         bookMarkVm: BookmarkViewModel,
         matchedCategories: Binding<[[String]]>,
         callCount: Int,
         category: [String]
    ) {
        self.notification = notification
        self.onClickEmoji = onClickEmoji
        self.onClickBookmark = onClickBookmark
        self._vm = StateObject(wrappedValue: vm)
        self._bookMarkVm = StateObject(wrappedValue: bookMarkVm)
        self._matchedCategories = matchedCategories
        self.callCount = callCount
        self.category = category
    }
    var body: some View {
        HStack(spacing: 0) {
            let categoryToShow = callCount < matchedCategories.count ? matchedCategories[callCount] : []
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink {
                    NotificationDetailView(vm: NotificationDetailViewModel(notificationId: notification.notificationId), homeVm: HomeViewModel(), onClickBookmark: {
                        onClickBookmark()
                    }, onClickEmoji: { emoji in
                        onClickEmoji(emoji)
                    })
                } label: {
                    HStack(alignment: .top) {
                        AlimoBookMark(isSelected: notification.isBookMarked,
                                      bookmarkAction: {onClickBookmark()},
                                      title: notification.title,
                                      content: notification.content,
                                      date:  formattedDate(notification.createdAt),
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
            await fetchCategories()
        }
    }
    private func fetchCategories() async {
        
        for category in category {
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
    
    private func formattedDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // 원하는 형식으로 설정
        return dateFormatter.string(from: date)
    }

}
