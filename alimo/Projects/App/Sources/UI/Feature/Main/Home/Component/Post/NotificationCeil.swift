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
    
    let notification: Notification
    
    @ViewBuilder
    private var profile: some View {
        AlimoAvatar().padding(.leading, 12)
            .toTop()
    }
    
    var body: some View {
        HStack(spacing: 0) {
            profile
            VStack(alignment: .leading, spacing: 0) {
                NavigationLink {
                    NotificationDetailView()
                } label: {
                    VStack(alignment: .leading, spacing: 0) {
                        ProfileCeil(isNew: true, title: notification.title, membername: String(notification.memberId))
                        Text(notification.content)
                            .lineLimit(6)
                            .font(.caption)
                            .foregroundColor(.main900)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(5)
                            .padding(.top, 12)
                    }
                }
                Text(notification.createdAt)
                    .foregroundStyle(Color.gray500)
                    .font(.cute)
                    .padding(.top, 12)
                IconCeil()
                    .padding(.top, 10)
            }
            .padding(.leading, 8)
        }
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }
}

