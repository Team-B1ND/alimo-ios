//
//  MemberService.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

fileprivate let client = AlimoHttpClient.live

struct MemberService {
    
    private let memberPath = "/member"
    
    func emailsVerificationRequest(_ email: String) async throws -> Response {
        try await client.request(memberPath + "/emails/verifications",
                                 Response.self,
                                 method: .post,
                                 parameters: email)
    }
    
    func alarmOnOff() async throws -> Response {
        try await client.request(memberPath + "/alarm-on-off",
                                 Response.self,
                                 method: .post)
    }
    
    func getMemberInfo() async throws -> Member {
        try await client.request(memberPath + "/info",
                                 ResponseData<MemberInfoResponse>.self,
                                 method: .get)
        .data.toDomain()
    }
    
    func emailsVerifications(_ request: EmailsVerificationsRequest) async throws -> Response {
        try await client.request(memberPath + "/emails/verification-requests",
                                 Response.self,
                                 method: .get,
                                 parameters: request)
    }
    
    func getCategoryList() async throws -> ResponseData<CategoryListResponse> {
        try await client.request(memberPath + "/category-list",
                                 ResponseData<CategoryListResponse>.self,
                                 method: .get)
    }
}

extension MemberService {
    static let live = MemberService()
}
