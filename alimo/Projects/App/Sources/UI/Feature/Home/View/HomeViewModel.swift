//
//  HomeViewModel.swift
//  App
//
//  Created by dgsw8th61 on 2/16/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

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
            self.notificationspeaketitle = notificationspeakeResponse.data.title
            self.memberID = notificationspeakeResponse.data.memberID
            
        } catch {
            print(error)
        }
    }
}


