//
//  BookMarkViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/25/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class BookmarkViewModel: ObservableObject {
    
    private let categoryService = CategoryService.live
    private let memberService = MemberService.live
    private let bookmarkService = BookmarkService.live
    
    @Published var category : [String] = []
    @Published var loudSpeaker: LoudSpeaker? = nil
    @Published var notificationList: [Notification] = []
    @Published var page = 1
    
    @Published var selectedIndex = -1 {
        didSet {
            Task {
                await fetchNotifications(isNew: true)
            }
        }
    }
    
    func fetchNotifications(isNew: Bool) async {
        do {
            let nextPage = isNew ? 1 : page + 1
            print("HomeVM - fetching notifications... nextPage: \(nextPage)")
            let selectedCategory = selectedIndex == -1 ? "all" : category[selectedIndex]
            let request = PageRequest(page: nextPage, size: pagingInterval)
            
            let notifications = try await bookmarkService.getBookmarkByCategory(category: selectedCategory, pageRequest: request)
            dump(notifications)
            if isNew {
                notificationList = notifications
            } else {
                notificationList.append(contentsOf: notifications)
            }
            
            if !notifications.isEmpty {
                page = nextPage
            }
            
        } catch {
            notificationList = []
            page = 1
            debugPrint(error)
        }
    }
    
    
    func patchBookmark(notificationId: Int) async {
        do {
            let res = try await bookmarkService.patchBookmark(notificationId: notificationId)
            dump(res)
        } catch {
            debugPrint(error)
        }
    }
}



