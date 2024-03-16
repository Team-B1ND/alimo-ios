//
//  MemberService.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import UIKit

fileprivate let client = AlimoHttpClient.live

struct MemberService {
    
    private let memberPath = "/member"
    
    func findPw(pw: String) async throws -> Response {
        try await client.request(memberPath + "/find-pw",
                                 Response.self,
                                 method: .post)
    }
    
    func emailsVerificationRequest(_ email: String) async throws -> Response {
        try await client.request(memberPath + "/emails/verification-requests?email=\(email)",
                                 Response.self,
                                 method: .post)
    }
    
    func alarmOnOff(isOffAlarm: Bool) async throws -> Response {
        try await client.request(memberPath + "/alarm-on-off?is_off_alarm=\(isOffAlarm)",
                                 Response.self,
                                 method: .post)
    }
    
    func modifyMember(image: UIImage) async throws -> Response? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to data")
            return nil
        }
        return try await client.upload(multipartFormData: {
            $0.append(imageData, withName: "image")
        }, to: memberPath + "/modify", Response.self, method: .patch)
    }
    
    func getNameByChildCode(childCode: String) async throws -> ResponseData<MemberNameResponse> {
        try await client.request(memberPath + "?childCode=\(childCode)",
                                 ResponseData<MemberNameResponse>.self)
    }
    
    func byebye() async throws -> Response {
        try await client.request(memberPath,
                                 Response.self,
                                 method: .delete)
    }
    
    func getMemberInfo() async throws -> Member {
        try await client.request(memberPath + "/info",
                                 ResponseData<MemberInfoResponse>.self,
                                 method: .get)
        .data.toDomain()
    }
    
    func emailsVerifications(_ request: EmailsVerificationsRequest) async throws -> ResponseData<TokenResponse> {
        try await client.request(memberPath + "/emails/verifications?email=\(request.email)&code=\(request.code)",
                                 ResponseData<TokenResponse>.self,
                                 method: .get)
    }
    
    func getCategoryList() async throws -> CategoryList {
        try await client.request(memberPath + "/category-list",
                                 ResponseData<CategoryListResponse>.self,
                                 method: .get).data.toDomain()
    }
    
}

extension MemberService {
    static let live = MemberService()
}
