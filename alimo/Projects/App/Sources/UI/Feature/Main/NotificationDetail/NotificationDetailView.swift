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
    
    enum Field {
        case comment
    }
    enum Dialog {
        case file
        case image
    }
    
    @StateObject private var keyboardHandler = KeyboardHandler()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var downloadManager: DownloadManager
    @StateObject var vm: NotificationDetailViewModel
    @FocusState private var commentInputState: Field?
    @State var showDialog = false
    @State var dialog = Dialog.file
    
    @ViewBuilder
    private var avatar: some View {
        Group {
            if let profileImage = vm.notification?.profileImage {
                AlimoAsyncAvatar(profileImage)
            } else {
                AlimoAvatar()
            }
        }
        .toTop()
    }
    
    @ViewBuilder
    private var profile: some View {
        if let notification = vm.notification {
            ProfileCeil(isNew: false, title: notification.title, membername: notification.name)
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
            if let notification = vm.notification {
                IconCeil(isBookmarked: notification.isBookMarked, hasEmoji: false) { emoji in
                    Task {
                        await vm.patchEmoji(emoji: emoji)
                    }
                } onClickBookmark: {
                    Task {
                        await vm.patchBookmark()
                    }
                }
                .padding(.top, 10)
            }
        }
    }
    
    @ViewBuilder
    private var downloads: some View {
        VStack {
            ForEach(vm.notification?.files ?? [], id: \.self) { file in
                FileCeil(file: file) {
                    // TODO: Download file
                    Task {
                        await vm.downloadFile(file: file) { data in
                            Task {
                                downloadManager.saveFileToDocuments(data: data, fileName: file.fileName)
                                dialog = .file
                                showDialog = true
                            }
                        }
                    }
                }
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
                if let images = vm.notification?.images {
                    if !images.isEmpty {
                        ImageCeil(images: vm.notification?.images ?? []) {
                            // TODO: Download images
                            Task {
                                await vm.downloadImages(images: vm.notification?.images ?? []) { images in
                                    images.forEach {
                                        downloadManager.saveImageToPhotos(image: $0)
                                    }
                                }
                                dialog = .image
                                showDialog = true
                            }
                        }
                        .padding(.top, 8)
                    }
                }
                info
            }
            .padding(.leading, 8)
        }
    }
    
    @ViewBuilder
    private var comment: some View {
        LazyVStack {
            ForEach(vm.notification?.comments.sorted { $0.createdAt < $1.createdAt } ?? [], id: \.commentId) { p in
                VStack {
//                    CommentCeil(p) {
//                        vm.selectedComment = p
//                        commentInputState = .comment
//                    }
                    
                    CommentCeil(
                        p,
                        onClickSubComment: {
                            vm.selectedComment = p
                            commentInputState = .comment
                        },
                        deleteComment: {
                            Task{
                                await vm.deleteComment(commentId: p.commentId)
                            }
                        })
    
                    .padding(.leading, 12)
                    .zIndex(1)
                    let subComments = p.subComments.sorted { $0.createdAt < $1.createdAt }
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
            let subCommentText = vm.selectedComment?.commentor == nil ? "" : vm.selectedComment!.commentor + "님에게 "
            TextField("\(subCommentText)댓글을 남겨보세요", text: $vm.contentText)
                .focused($commentInputState, equals: .comment)
            let isCommentEmpty = vm.contentText.isEmpty
            Button {
                Task {
                    await vm.createComment()
                    await vm.fetchNotification()
                }
            } label: {
                let imojiColor: Color = isCommentEmpty ? .gray300 : .gray600
                Image("Send")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(imojiColor)
                    .frame(width: 24, height: 24)
            }
            .disabled(isCommentEmpty)
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
                    EmojiContainer(selectedEmoji: vm.selectedEmoji, emojies: vm.emojies) { emoji in
                        Task {
                            await vm.patchEmoji(emoji: emoji)
                        }
                    }
                    .padding(.top, 16)
                    comment
                        .padding(.top, 16)
                    Spacer()
                        .frame(height: 100)
                }
                .background(Color.white)
                .onTapGesture {
                    if vm.contentText.isEmpty {
                        print("NotificationDetailV - normal comment mode")
                        vm.selectedComment = nil
                    } else {
                        print("NotificationDetailV - commentting.. yet")
                    }
                    endTextEditing()
                }
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
        .navigationBarBackButtonHidden()
        .alimoToolbar("") {
            dismiss()
        }
        .task {
            await vm.fetchEmojies()
            await vm.fetchNotification()
        }
        .alert(isPresented: $showDialog) {
            switch dialog {
            case .file:
                Alert(title: Text("파일 다운로드 성공"),
                      dismissButton: .default(Text("닫기")))
            case .image:
                Alert(title: Text("이미지 다운로드 성공"),
                      dismissButton: .default(Text("닫기")))
            }
        }
    }
}
