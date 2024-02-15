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
    
    private let emailsVerificationsPath = "/member/emails/verifications"
    private let alarmOnOffPath = "/member/alarm-on-off"
    private let memberInfoPath = "/member/info"
    private let emailsVerificationRequestPath = "/member/emails/verification-requests"
    private let categoryListPath = "/member/category-list"
    
    func emailsVerificationRequest(_ email: String) async throws -> Response {
        try await client.request("\(emailsVerificationRequestPath)/",
                                 Response.self,
                                 method: .post,
                                 parameters: email)
    }
    
    func alarmOnOff() async throws -> Response {
        try await client.request("\(alarmOnOffPath)/",
                                 Response.self,
                                 method: .post)
    }
    
    func getMemberInfo() async throws -> ResponseData<MemberInfoResponse> {
        try await client.request("\(memberInfoPath)/",
                                 ResponseData<MemberInfoResponse>.self,
                                 method: .get)
    }
    
    func emailsVerifications(_ request: EmailsVerificationsRequest) async throws -> Response {
        try await client.request("\(emailsVerificationsPath)/",
                                 Response.self,
                                 method: .get,
                                 parameters: request)
    }
    
    func getCategoryList() async throws -> ResponseData<CategoryListResponse> {
        try await client.request("\(categoryListPath)/",
                                 ResponseData<CategoryListResponse>.self,
                                 method: .get)
    }
}

extension MemberService {
    static let live = MemberService()
}
