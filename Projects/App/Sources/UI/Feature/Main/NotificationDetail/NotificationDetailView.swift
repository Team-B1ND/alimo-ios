//
//  DetailPostView.swift
//  App
//
//  Created by dgsw8th61 on 1/8/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI
import ADS

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
    @EnvironmentObject private var appState: AppState
    @StateObject var vm: NotificationDetailViewModel
    @StateObject var homeVm: HomeViewModel
    @FocusState private var commentInputState: Field?
    @State var showDialog = false
    @State var dialog = Dialog.file
    @State var reader: ScrollViewProxy?
    var onClickBookmark: () -> Void
    var onClickEmoji: (EmojiType) -> Void
    
    @ViewBuilder
    private var avatar: some View {
//        AlimoAsyncAvatar(vm.notification?.profileImage)
//            .toTop()
        // TODO: Add view
        EmptyView()
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
            Text(LocalizedStringKey(notification.content))
                .applyOpenURL()
                .foregroundStyle(Color.black)
//                .font(.bodyLight) // TODO: fix font
                .lineSpacing(4)
                .padding(.bottom,12)
        }
    }
    
    @ViewBuilder
    private var info: some View {
        if let notification = vm.notification {
            Text(notification.createdAt.ymdText)
                .foregroundStyle(Color.gray500)
                .font(.caption)
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
            }
        }
    }
    
    @ViewBuilder
    private var downloads: some View {
        VStack(spacing: 8) {
            ForEach(vm.notification?.files ?? [], id: \.self) { file in
                FileCeil(file: file) {
                   
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
        .padding(.top, 8)
    }
    
    @ViewBuilder
    private var notificationContainer: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .top) {
                        AlimoNotification(
                            vm.notification!.title,
                            user: vm.notification!.name,
                            content: vm.notification!.content,
                            isSelected: vm.notification!.isBookMarked,
                            date: vm.notification!.createdAt,
                            addEmojiAction: {emoji in
                                onClickEmoji(emoji)
                            },
                            bookmarkAction: {
                                Task {
                                    await homeVm.patchBookmark(notificationId: vm.notification?.notificationId ?? 0)
                                    await vm.fetchNotification()
                                }
                            },
                            files: {
                                var fileInfoArray: [FileInfo] = []
                                
                                if let files = vm.notification?.files, !files.isEmpty {
                                    fileInfoArray.append(contentsOf: files.map { file in
                                        FileInfo(title: file.fileName, type: .image(byte: file.fileSize)) {}
                                    })
                                }
                                
                                if let images = vm.notification?.images, !images.isEmpty  {
                                    fileInfoArray.append(FileInfo(title: images[0].fileName, type: .file(count: vm.notification?.images.count ?? 0)) {
                                        Task {
                                            await vm.downloadImages(images: vm.notification?.images ?? []) { images in
                                                images.forEach {
                                                    downloadManager.saveImageToPhotos(image: $0)
                                                }
                                            }
                                        }
                                        dialog = .image
                                        showDialog = true
                                    })
                                }
                                
                                return fileInfoArray
                            }(),
                            fileDestination: {
                                PreviewImageView( imageUrls: (vm.notification?.images ?? []).compactMap { ($0 as? ImageOrFile)?.fileUrl },
                                                  name:  vm.notification?.name ?? "",
                                                  Info: (vm.notification?.createdAt.ymdText)!,
                                                  onClickDownload:{})
                            },
                            hasEmoji: true,
                            emoji: vm.notification?.emoji ?? nil
                        )
                    }
                    .truncationMode(.tail)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
                }
            }
        
//        HStack(spacing: 0) {
//            avatar
//            VStack(alignment: .leading, spacing: 0) {
//                profile
//                content
//                    .padding(.top, 12)
//                VStack(spacing: 8) {
//                    if !(vm.notification?.files.isEmpty ?? true) {
//                        downloads
//                    }
//                    if let images = vm.notification?.images {
//                        VStack(spacing: 8) {
//                            if !images.isEmpty {
//                                ImageCeil(images: vm.notification?.images ?? [], info: (vm.notification?.createdAt.ymdText)!, name: vm.notification?.name ?? "") {
//                                  
//                                    Task {
//                                        await vm.downloadImages(images: vm.notification?.images ?? []) { images in
//                                            images.forEach {
//                                                downloadManager.saveImageToPhotos(image: $0)
//                                            }
//                                        }
//                                        dialog = .image
//                                        showDialog = true
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }
//                info
//                    .padding(.top, 12)
//            }
//            .padding(.leading, 8)
//        }
    }
    
    @ViewBuilder
    private var comment: some View {
        let memberId = appState.member?.memberId ?? 0
        LazyVStack {
            ForEach(vm.notification?.comments.sorted { $0.createdAt < $1.createdAt } ?? [], id: \.commentId) { p in
                VStack {
                    CommentCeil(
                        p,
                        isMe: p.commenterId == memberId,
                        onClickSubComment: {
                            vm.selectedComment = p
                            commentInputState = .comment
                        },
                        deleteComment: {
                            Task {
                                await vm.deleteComment(commentId: p.commentId)
                                await vm.fetchNotification()
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
                            SubCommentCeil(
                                c,
                                isMe: c.commenterId == memberId
                            ) {
                                Task {
                                    await vm.deleteSubComment(commentId: c.commentId)
                                    await vm.fetchNotification()
                                }
                            }
//                            .padding(.leading, 44 + 12)
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
            }
        }
    }
    
    @ViewBuilder
    private var commentInput: some View {
        HStack {
            let subCommentText = vm.selectedComment?.commentor == nil ? "" : vm.selectedComment!.commentor + "님에게 "
            TextField("\(subCommentText)댓글을 남겨보세요", text: $vm.contentText)
                .focused($commentInputState, equals: .comment)
                .autocorrectionDisabled()
            let isCommentEmpty = vm.contentText.isEmpty
            Button {
                Task {
                    await vm.createComment()
                    await vm.fetchNotification()
                    withAnimation {
                        self.reader?.scrollTo("bottom")
                    }
                }
            } label: {
                let imojiColor: Color = isCommentEmpty ? .gray300 : .gray700
                Image(.send)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(imojiColor)
                    .frame(width: 28, height: 28)
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
        ZStack {
            ScrollViewReader { reader in
                ScrollView(showsIndicators: false) {
                    switch vm.flow {
                    case .fetching:
                        NotificationCellShimmer()
                            .shimmer()
                    default:
                        VStack(spacing: 0) {
                            notificationContainer
                                .padding(.top, 20)
                                .padding(.leading, 12)
                                .padding(.trailing, 16)
                            Divider()
                                .padding(.top, 16)
//                            EmojiContainer(selectedEmoji: vm.selectedEmoji, emojies: vm.emojies) { emoji in
//                                Task {
//                                    await vm.patchEmoji(emoji: emoji)
//                                }
//                            }
//                            .padding(.top, 16)
                            comment
                                .padding(.top, 16)
                            Spacer()
                                .frame(height: 100)
                                .id("bottom")
                        }
                        .background(Color.white)
                        .onTapGesture {
                            if vm.contentText.isEmpty {
                                vm.selectedComment = nil
                            }
                            endTextEditing()
                        }
                        .onAppear {
                            self.reader = reader
                        }
                    }
                }
                .refreshable {
                    Task {
                        vm.flow = .fetching
                        await vm.fetchEmojies()
                        await vm.fetchNotification()
                    }
                }
                .alert("게시글을 불러올 수 없습니다",
                       isPresented: .init(get: { vm.flow == .failure }, set: { _ in dismiss() })) {
                    Button("확인", role: .cancel) {}
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
            vm.flow = .fetching
            
            await withTaskGroup(of: Void.self) { group in
                group.addTask {
                    await vm.fetchEmojies()
                }
                group.addTask {
                    await vm.fetchNotification()
                }
            }
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
