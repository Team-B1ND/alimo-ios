//
//  Morebutton.swift
//  App
//
//  Created by dgsw8th61 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

struct NotificationCeil: View {
    
    var notification: Notification
    var onClickEmoji: (EmojiType) -> Void
    var onClickBookmark: () -> Void
    
    init(notification: Notification,
         onClickEmoji: @escaping (EmojiType) -> Void,
         onClickBookmark: @escaping () -> Void) {
        self.notification = notification
        self.onClickEmoji = onClickEmoji
        self.onClickBookmark = onClickBookmark
    }
    
    @ViewBuilder
    private var avatar: some View {
        AlimoAvatar()
            .toTop()
    }
    
    @ViewBuilder
    private var profile: some View {
        ProfileCeil(isNew: false, title: notification.title, membername: notification.name)
    }
    
    @ViewBuilder
    private var content: some View {
        Text(notification.content)
            .lineLimit(6)
            .font(.label)
            .foregroundColor(.main900)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
            .lineSpacing(5)
    }
    
    @ViewBuilder
    private var info: some View {
        Text(notification.createdAt.ymdText)
            .foregroundStyle(Color.gray500)
            .font(.cute)
            .padding(.top, 12)
        IconCeil(emoji: notification.emoji, isBookmarked: notification.isBookMarked) {
            onClickEmoji($0)
        } onClickBookmark: {
            onClickBookmark()
        }
        .padding(.top, 10)
    }
    
    var body: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink {
                    NotificationDetailView(vm: NotificationDetailViewModel(notificationId: notification.notificationId))
                } label: {
                    VStack(alignment: .leading, spacing: 0) {
                        profile
                        content
                            .padding(.top, 12)
                    }
                }
                info
            }
            .padding(.leading, 8)
        }
        .padding(.leading, 12)
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }
}

