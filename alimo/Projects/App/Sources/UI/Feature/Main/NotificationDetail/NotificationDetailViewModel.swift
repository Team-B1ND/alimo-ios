//
//  NotificationDetailViewModel.swift
//  App
//
//  Created by dgsw8th71 on 2/27/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

fileprivate let emojiService = EmojiService.live
fileprivate let notificationService = NotificationService.live
fileprivate let commentService = CommentService.live
fileprivate let memberService = MemberService.live
fileprivate let bookmarkService = BookmarkService.live

@MainActor
final class NotificationDetailViewModel: ObservableObject {
    
    let notificationId: Int
    
    @Published var emojies: [Emoji] = []
    @Published var notification: NotificationRead? = nil
    @Published var selectedEmoji: Emoji? = nil {
        didSet {
            Task {
                if let emojiType = selectedEmoji?.emojiType {
                    await patchEmoji(emoji: emojiType)
                    await fetchEmojies()
                }
            }
        }
    }
    @Published var contentText = ""
    private var isNotificationFetching = false
    @Published var isBookmarked = false
    
    init(notificationId: Int) {
        self.notificationId = notificationId
    }
    
    func getIsFetching() -> Bool {
        return isNotificationFetching
    }
    
    func fetchEmojies() async {
        do {
            emojies = try await emojiService.loadEmoji(notificationId: notificationId)
            dump(emojies)
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchNotification() async {
        do {
            let notification = try await notificationService.getNotification(id: notificationId)
            self.notification = notification
            dump(notification)
        } catch {
            debugPrint(error)
        }
    }
    
    func patchEmoji(emoji: EmojiType) async {
        do {
            let request = PatchEmojiRequest(reaction: emoji.rawValue)
            _ = try await emojiService.patchEmoji(notificationId: notificationId, request: request)
            print("NotificationDetailVM - fetching to patch emoji success")
        } catch {
            debugPrint(error)
        }
    }
    
    func createComment() async {
        defer { contentText = "" }
        do {
            let request = CreateCommentRequest(content: contentText,
                                               parentId: nil)
            _ = try await commentService.createComment(notificationId: notificationId, request: request)
            print("NotificationDetailVM - comment created")
        } catch {
            debugPrint(error)
        }
    }
    
    func patchBookmark() async {
        do {
            let res = try await bookmarkService.patchBookmark(notificationId: notificationId)
            dump(res)
        } catch {
            debugPrint(error)
        }
    }
}
