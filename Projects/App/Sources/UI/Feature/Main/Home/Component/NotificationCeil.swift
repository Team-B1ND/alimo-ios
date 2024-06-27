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
    enum Dialog {
        case file
        case image
    }
    
    var notification: Notification
    var onClickEmoji: (EmojiType) -> Void
    var onClickBookmark: () -> Void
    @State var showDialog = false
    @State var dialog = Dialog.file
    @StateObject var vm: NotificationDetailViewModel
    @EnvironmentObject var downloadManager: DownloadManager
    
    init(notification: Notification,
         onClickEmoji: @escaping (EmojiType) -> Void,
         onClickBookmark: @escaping () -> Void,
         vm:NotificationDetailViewModel) {
        self.notification = notification
        self.onClickEmoji = onClickEmoji
        self.onClickBookmark = onClickBookmark
        self._vm = StateObject(wrappedValue: vm)
    }
    
    @ViewBuilder
    private var avatar: some View {
        AlimoAsyncAvatar(notification.profileImage)
            .toTop()
    }
    
    @ViewBuilder
    private var profile: some View {
        ProfileCeil(isNew: false, title: notification.title, membername: notification.name)
    }
    
    @ViewBuilder
    private var content: some View {
        Text(LocalizedStringKey(notification.content))
            .applyOpenURL()
            .foregroundStyle(Color.black)
            .font(.bodyLight)
            .lineSpacing(4)
            .lineLimit(6)
            .truncationMode(.tail)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.leading)
    }
    
    @ViewBuilder
    private var info: some View {
        Text(notification.createdAt.ymdText)
            .foregroundStyle(Color.gray500)
            .font(.caption)
            .padding(.top, 12)
        IconCeil(emoji: notification.emoji, isBookmarked: notification.isBookMarked) {
            onClickEmoji($0)
        } onClickBookmark: {
            onClickBookmark()
        }
        .padding(.top, 10)
    }
    
    @ViewBuilder
    private var downloads: some View {
        VStack(spacing: 8) {
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
        .padding(.top, 8)
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
                        VStack(spacing: 8) {
                            if !(vm.notification?.files.isEmpty ?? true) {
                                downloads
                            }
                            if let images = vm.notification?.images {
                                VStack(spacing: 8) {
                                    if !images.isEmpty {
                                        ImageCeil(images: vm.notification?.images ?? [], info: (vm.notification?.createdAt.ymdText)!, name: vm.notification?.name ?? "") {
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
                                    }
                                }
                            }
                        }
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
        .task {
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

