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
    @Published var notificationspeaketitle : String = ""
    @Published var memberID : Int? = nil
    @Published var title : String = ""
    @Published var content : String = ""
    @Published var createdAt : String = ""
    @Published var membername : String = ""
    @Published var image: SwiftUI.Image? = nil

    
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
            
            print("notificationload 결과 : \(notificationloadresponse)")
            
            self.title = notificationloadresponse.data.first?.title ?? "제목"
            self.content = notificationloadresponse.data.first?.content ?? "내용"
            self.createdAt = notificationloadresponse.data.first?.createdAt ?? "날짜"
            self.membername = notificationloadresponse.data.first?.member.name ?? "작성자"
            
            
//            let imageUrlString = "테스트 url"
//            if let imageUrl = URL(string: imageUrlString) {
//                loadImageFromURL(imageUrl) { image in
//                    if let image = image {
//                        self.image = Image(uiImage: image)
//                    }
//                }
//            }
            if let imageUrlString = notificationloadresponse.data.first?.images.first?.fileUrl,
               let imageUrl = URL(string: imageUrlString) {
                loadImageFromURL(imageUrl) { image in
                    if let image = image {
                        self.image = Image(uiImage: image)
                    }
                }
            }
            
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



