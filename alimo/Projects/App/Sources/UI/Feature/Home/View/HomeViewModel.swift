//
//  HomeViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/16/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    private let homeService = HomeService.live
    @Published var category : [String] = []
    @Published var notificationspeaketitle : String = ""
    @Published var memberID : Int? = nil

    
    func getcategory() async {
        do {
            let getcategoryResponse = try await homeService.getcategory()
            self.category = getcategoryResponse.data.roles
            print(category)
        } catch {
            print(error)
        }
    }
    
    func notificationspeake() async {
        do {
            let notificationspeakeResponse = try await homeService.notificationspeaker()
            print(notificationspeakeResponse)
            self.notificationspeaketitle = notificationspeakeResponse.title
            self.memberID = notificationspeakeResponse.memberID

            
        } catch {
            print(error)
        }
    }
    
    func notificationload() async {
        do {
            let request = NotificationloadRequest(pageRequest: Page(page: 0, size: 0), category: "테스트") // NotificationloadRequest의 인스턴스 생성
            let notificationloadResponse = try await homeService.notificationload(request) // 생성한 인스턴스를 인자로 전달
            print("notificationload 결과 : \(notificationloadResponse)")
        } catch {
            print(error)
        }
    }

}


