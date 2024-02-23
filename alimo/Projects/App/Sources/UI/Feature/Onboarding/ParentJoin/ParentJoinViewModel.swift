//
//  ParentJoinViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

fileprivate let fcmCache = FcmCache.live

@MainActor
class ParentJoinViewModel: ObservableObject {
    
    private var memberService = MemberService.live
    private var authService = AuthService.live
    
    @Published var memberId: Int? = nil
    
    // 부모님 이메일, 비밀번호
    @Published var email: String = ""
    @Published var password: String = ""
    
    // pw 확잉ㄴ
    @Published var pwCheck: String = ""
    
    // 학생 코드
    @Published var childCode: String = ""
    
    // 학생 코드 인증 여부
    @Published var isCorrectChildCode: Bool = false
    
    @Published var isCorrectSignUp = false
    
    // dialog on/off 변수
    @Published var showDialog: Bool = false
    @Published var dialogMessage = ""
    
    // 이메일 인증 코드
    @Published var code: String = ""
    @Published var isFetching = false
    
    
    // login first
    func verifyChildCode() async {
        isFetching = true
        defer { isFetching = false }
        var response: ResponseData<ChildCodeResponse>
        
        do {
            
            response = try await authService.verifyChildCode(childCode)
            
            isCorrectChildCode = response.data.isCorrectChildCode
            memberId = response.data.memberId
            
        } catch {
   
            let code = error.code
            switch code {
            case 400:
                dialogMessage = "사용 불가능한 학생 코드"
                showDialog = true
            case 404:
                dialogMessage = "학생 코드를 찾을 수 없습니다"
                showDialog = true
            default:
                debugPrint(error)
                dialogMessage = "알 수 없는 에러가 발생했습니다"
                showDialog = true
            }
        }
    }
    
    // login second
    func signUp() async {
        isFetching = true
        defer { isFetching = false }
        do {
            
            if let memberId = memberId {
                
                let request = SignUpRequest(email: email,
                                            password: password,
                                            fcmToken: fcmCache.getToken(of: .fcmToken),
                                            childCode: childCode,
                                            memberId: memberId)
                print(request)
                _ = try await authService.signUp(request)
                isCorrectSignUp = true
            } else {
                // handle error
                return
            }
            
        } catch {
            print(error)
        }
        
    }
    
    // login third
    func emailsVerificationRequest() async {
        isFetching = true
        defer { isFetching = false }
        do {
            
            let response = try await memberService.emailsVerificationRequest(email)
            
        } catch {
            print(error)
        }
        
    }
    
    // login last
    func emailsVerifications(onSuccess: @escaping (String, String) -> Void) async {
        
        do {
            let request = EmailsVerificationsRequest(email: email, code: code)
            let response = try await memberService.emailsVerifications(request).data
            withAnimation {
                onSuccess(response.accessToken, response.refreshToken)
            }
            
        } catch {
            print(error)
        }
        
    }
}
