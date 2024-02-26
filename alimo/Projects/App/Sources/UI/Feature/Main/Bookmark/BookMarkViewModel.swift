//
//  BookMarkViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/25/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class BookMarkViewModel: ObservableObject {
    private let bookmarkService = BookmarkService.live
    
    @Published var bookmarkList: [Notification] = []
    
    func bookmarkload(_ selectedcategory : String) async {
        do {
//            let notificationloadresponse = try await bookmarkService.bookmarkload(selectedcategory, NotificationloadRequest(pageRequest: Page(page: 1, size: 1)))
            
//            print("notificationload 결과 : \(notificationloadresponse)")
        } catch {
            debugPrint(error)
        }
    }
}



