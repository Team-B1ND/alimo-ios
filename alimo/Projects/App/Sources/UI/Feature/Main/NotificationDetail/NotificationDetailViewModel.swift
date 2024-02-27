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

@MainActor
final class NotificationDetailViewModel: ObservableObject {
    
    let notificationId: Int
    
    @Published var emojies: [Emoji] = []
    @Published var notification: NotificationRead? = nil
    
    init(notificationId: Int) {
        self.notificationId = notificationId
    }
    
    func fetchEmojies() async {
        do {
            emojies = try await emojiService.loadEmoji(notificationId: notificationId)
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchNotification() async {
        do {
            notification = try await notificationService.getNotification(id: notificationId)
        } catch {
            debugPrint(error)
        }
    }
}
