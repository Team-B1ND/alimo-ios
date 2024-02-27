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
    @State var isButtonPressed = false
    @State var commentText = ""
    var notification: Notification
    
    @ViewBuilder
    private var avatar: some View {
        AlimoAvatar()
            .toTop()
    }
    
    @ViewBuilder
    private var profile: some View {
        ProfileCeil(isNew: false, title: notification.title, membername: String(notification.memberId))
    }
    
    @ViewBuilder
    private var content: some View {
        Text(notification.content)
            .font(.caption)
            .lineSpacing(5)
    }
    
    @ViewBuilder
    private var info: some View {
        Text(notification.createdAt)
            .foregroundStyle(Color.gray500)
            .font(.cute)
            .padding(.top, 12)
        IconCeil()
            .padding(.top, 10)
    }
    
    @ViewBuilder
    private var notificationContainer: some View {
        HStack(spacing: 0) {
            avatar
            VStack(alignment: .leading, spacing: 0) {
                profile
                content
                    .padding(.top, 12)
                info
            }
            .padding(.leading, 8)
        }
    }
    
    @ViewBuilder
    private var comment: some View {
        LazyVStack {
            ForEach(dummyComment, id: \.0) { p in
                VStack {
                    CommentCeil(p.1, isParent: true)
                        .padding(.leading, 12)
                        .zIndex(1)
                    ForEach(Array(p.2.enumerated()), id: \.1.0) { idx, c in
                        let len: CGFloat = CGFloat((idx == 0
                                                    ? p.1 : p.2[idx - 1].1).filter { $0 == "\n" }.count)
                        ZStack {
                            CommentCeil(c.1, isParent: false)
                                .padding(.leading, 44 + 12)
                            let radius: CGFloat = 3
                            let height: CGFloat = 62 + len * 20 + radius
                            
                            Path { path in
                                path.move(to: CGPoint(x: 0, y: 0))
                                path.addLine(to: CGPoint(x: 0, y: height))
                                path.addArc(center: CGPoint(x: radius, y: height),
                                            radius: radius,
                                            startAngle: Angle(degrees: -180),
                                            endAngle: Angle(degrees: 90),
                                            clockwise: true)
                                path.addLine(to: CGPoint(x: 16, y: height + radius))
                            }
                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
                            .padding(.leading, 27)
                            .foregroundStyle(Color.gray100)
                            .offset(y: -height + 20)
                        }
                        
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private var commentInput: some View {
        HStack {
            TextField("댓글을 남겨보세요", text: $commentText)
            Button {
                
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
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    notificationContainer
                        .padding(.top, 20)
                        .padding(.leading, 12)
                        .padding(.trailing, 16)
                    Divider()
                        .padding(.top, 16)
//                    EmojiContainer(emojies: emojies)
//                        .padding(.top, 16)
                    comment
                        .padding(.top, 16)
                    Rectangle()
                        .padding(.top, 24)
                        .foregroundStyle(Color.gray100)
                        .frame(maxWidth: .infinity)
                        .frame(height: 108)
                }
            }
            commentInput
                .toBottom()
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action: {
            dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        })
        .onTapGesture {
            endTextEditing()
        }
    }
}
