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
    private let homeService = HomeService.live
    @Published var category : [String] = []
    @Published var loudSpeaker: LoudSpeaker? = nil
    @Published var notificationList: [Notification] = []

    
    func fetchCategoryList() async {
        do {
            let roles = try await homeService.getcategory().roles
            dump(roles)
            category = roles
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchLoudSpeaker() async {
        do {
            loudSpeaker = try await homeService.loudSpeaker()
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchNotifications(_ selectedcategory: String) async {
        do {
            let request = NotificationloadRequest(page: 1, size: 10)
            notificationList = try await homeService.notificationLoad(selectedcategory, pageRequest: request)
        } catch {
            debugPrint(error)
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
    
    
    private func loadImageFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
            AF.request(url).responseImage { response in
                if case .success(let image) = response.result {
                    completion(image)
                    print("성공")
                } else {
                    completion(nil)
                    print("실패")
                }
            }
        }
    
}



