//
//  OnboardingService.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Alamofire

fileprivate let client = AlimoHttpClient.live

final class OnboardingService {
    
    private let emailsVerificationRequestPath = "/member/emails/verification-requests"
    private let emailsVerificationsPath = "/member/emails/verifications"
    private let memberInfoPath = "/member/info"
    
    func emailsVerificationRequest(_ email: String) async throws -> Response {
        try await client.request("\(emailsVerificationRequestPath)/",
                                 Response.self,
                                 method: .post,
                                 parameters: email)
    }
    
    func emailsVerifications(_ request: EmailsVerificationsRequest) async throws -> Response {
        try await client.request("\(emailsVerificationsPath)/",
                                 Response.self,
                                 method: .get,
                                 parameters: request)
    }
    
    func getMemberInfo() async throws -> ResponseData<MemberInfoResponse> {
        try await client.request("\(memberInfoPath)/",
                                 ResponseData<MemberInfoResponse>.self,
                                 method: .get)
    }
}

extension OnboardingService {
    static let live = OnboardingService()
}
