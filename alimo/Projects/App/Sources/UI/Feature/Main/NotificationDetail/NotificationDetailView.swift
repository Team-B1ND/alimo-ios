//
//  DetailPostView.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate let dummyComment = [
    (UUID(), "ㅎㅇ", []),
    (UUID(), "ㅎㅇㅎㅇ", [(UUID(), "ㅎㅇ1"),
                      (UUID(), "ㅎㅇ1\nasd\nsa"),
                      (UUID(), "ㅎㅇ2\n123\n213\n123"),
                      (UUID(), "ㅎㅇ1"),
                      (UUID(), "ㅎㅇ1\n123\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1\n1"),
                      (UUID(), "He")
                     ])
]

struct NotificationDetailView: View {
    
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: NotificationDetailViewModel
    
    @ViewBuilder
    private var avatar: some View {
        AlimoAvatar()
            .toTop()
    }
    
    @ViewBuilder
    private var profile: some View {
        if let notification = vm.notification {
            ProfileCeil(isNew: false, title: notification.title, membername: String(notification.memberId))
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if let notification = vm.notification {
            Text(notification.content)
                .font(.label)
                .lineSpacing(5)
        }
    }
    
    @ViewBuilder
    private var info: some View {
        if let notification = vm.notification {
            Text(notification.createdAt.ymdText)
                .foregroundStyle(Color.gray500)
                .font(.cute)
                .padding(.top, 12)
            IconCeil(isBookmarked: vm.isBookmarked) {
                Task {
                    await vm.patchBookmark()
                    await vm.fetchNotification()
                }
            }
            .padding(.top, 10)
        }
    }
    
    @ViewBuilder
    private var downloads: some View {
        VStack {
            ForEach(vm.notification?.files ?? [], id: \.self) { file in
                FileCeil(file: file)
            }
        }
    }
    
    @ViewBuilder
    private var notificationContainer: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 0) {
                profile
                content
                    .padding(.top, 12)
                downloads
                    .padding(.top, 12)
                info
            }
            .padding(.leading, 8)
        }
    }
    
    @ViewBuilder
    private var comment: some View {
        LazyVStack {
            ForEach(vm.notification?.comments ?? [], id: \.commentId) { p in
                VStack {
                    CommentCeil(p)
                        .padding(.leading, 12)
                        .zIndex(1)
                    let subComments = p.subComments
                    ForEach(0..<subComments.count, id: \.self) { idx in
                        let c = subComments[idx]
                        let len: CGFloat = CGFloat((idx == 0
                                                    ? p.content : subComments[idx - 1].content).filter { $0 == "\n" }.count)
                        ZStack {
                            SubCommentCeil(c)
                                .padding(.leading, 44 + 12)
                            let radius: CGFloat = 3
                            let height: CGFloat = 62 + len * 20 + radius
                            
//                            Path { path in
//                                path.move(to: CGPoint(x: 0, y: 0))
//                                path.addLine(to: CGPoint(x: 0, y: height))
//                                path.addArc(center: CGPoint(x: radius, y: height),
//                                            radius: radius,
//                                            startAngle: Angle(degrees: -180),
//                                            endAngle: Angle(degrees: 90),
//                                            clockwise: true)
//                                path.addLine(to: CGPoint(x: 16, y: height + radius))
//                            }
//                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
//                            .padding(.leading, 27)
//                            .foregroundStyle(Color.gray100)
//                            .offset(y: -height + 20)
                        }
                    }
                }
                .padding(.trailing, 8)
            }
        }
    }
    
    @ViewBuilder
    private var commentInput: some View {
        HStack {
            TextField("댓글을 남겨보세요", text: $vm.contentText)
            Button {
                Task {
                    await vm.createComment()
                    await vm.fetchNotification()
                }
            } label: {
                Image("Send")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color.gray600)
                    .frame(width: 24, height: 24)
            }
            .toTrailing()
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Color.white)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(Color.gray100)
                .padding(.top, -1)
                .toTop()
        )
    }
    
    var body: some View {
        let isFetching = vm.getIsFetching()
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    notificationContainer
                        .padding(.top, 20)
                        .padding(.leading, 12)
                        .padding(.trailing, 16)
                    Divider()
                        .padding(.top, 16)
                    EmojiContainer(selectedEmoji: $vm.selectedEmoji, emojies: vm.emojies)
                        .padding(.top, 16)
                    comment
                        .padding(.top, 16)
                    Spacer()
                        .frame(height: 100)
                }
                .background(Color.white)
            }
            .refreshable {
                Task {
                    await vm.fetchEmojies()
                    await vm.fetchNotification()
                }
            }
            commentInput
                .toBottom()
        }
        .onChange(of: vm.isBookmarked) { _ in
            Task {
                await vm.patchBookmark()
            }
        }
        .navigationBarBackButtonHidden()
        .alimoToolbar("") {
            dismiss()
        }
        .onTapGesture {
            endTextEditing()
        }
        .task {
            await vm.fetchEmojies()
            await vm.fetchNotification()
        }
    }
}
