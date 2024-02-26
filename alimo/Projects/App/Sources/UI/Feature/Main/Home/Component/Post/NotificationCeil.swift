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
    
    var body: some View {
        HStack(spacing: 8) {
            VStack {
                AlimoAvatar().padding(.leading, 12)
                Spacer()
            }
            VStack(alignment: .leading, spacing: 0) {
                Profile(newpost: true, title: notification.title, membername: String(notification.memberId))
                NavigationLink {
                    DetailPostView()
                } label: {
                    Contents(content: notification.content)
                        .padding(.top, 12)
                    
                    Postimage()
                        .padding(.vertical)
                }
                Text(notification.createdAt)
                    .foregroundStyle(Color.gray500)
                    .font(.cute)
                    .padding(.top, 12)
                
                Icons()
                    .padding(.top, 12)
            }
        }
        .padding(.top, 20)
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }
}

