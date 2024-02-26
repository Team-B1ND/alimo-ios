//
//  HomeViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/16/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI
import AlamofireImage
import Alamofire

@MainActor
class HomeViewModel: ObservableObject {
    private let categoryService = CategoryService.live
    private let memberService = MemberService.live
    private let notificationService = NotificationService.live
    
    @Published var category : [String] = []
    @Published var loudSpeaker: LoudSpeaker? = nil
    @Published var notificationList: [Notification] = []

    
    func fetchCategoryList() async {
        do {
            let roles = try await memberService.getCategoryList().roles
            dump(roles)
            category = roles
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchLoudSpeaker() async {
        do {
            loudSpeaker = try await notificationService.loudSpeaker()
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchNotifications(_ selectedcategory: String) async {
        do {
            let request = PageRequest(page: 1, size: 10)
            notificationList = try await notificationService.getNotificationByCategory(category: selectedcategory, request: request)
        } catch {
            debugPrint(error)
        }
    }
}
