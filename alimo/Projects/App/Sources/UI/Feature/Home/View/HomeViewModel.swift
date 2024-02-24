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
    @Published var title : String = ""

    
    func getcategory() async {
        do {
            let getcategoryResponse = try await homeService.getcategory()
            self.category = getcategoryResponse.data.roles
            print(getcategoryResponse)
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
    
    func notificationload(_ selectedcategory : String) async {
        do {
            let notificationloadresponse = try await homeService.notificationload(selectedcategory, pageRequest:NotificationloadRequest(pageRequest: Page(page: 1, size: 1)))
            self.title = notificationloadresponse.data.first?.title ?? ""
            print("notificationload 결과 : \(notificationloadresponse)")
            
            
        } catch {
            print(error)
        }
    }
    
    func notificationread( _ notificationId : Int) async {
        do {
            let notificationreadresponse = try await homeService.notificationread(notificationId)
            print("notificationread 결과 : \(notificationreadresponse)")
            
            
        } catch {
            print(error)
        }
    }

}


