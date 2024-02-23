//
//  ParentJoinViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import Alamofire

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
    @Published var showChildCodeWrongDialog: Bool? = false
    
    // 이메일 인증 코드
    @Published var code: String = ""
    
    // 이메일 인증 여부
    @Published var isCorrectEmailCode: Bool = false
    
    // login first
    func verifyChildCode() async {
        
        var response: ResponseData<ChildCodeResponse>
        
        do {
            
            response = try await authService.verifyChildCode(childCode)
            
            isCorrectChildCode = response.data.isCorrectChildCode
            memberId = response.data.memberId
            
        } catch {
   
            let code = error.code
            
            switch code {
            case 400:
                print("code: \(code)")
                showChildCodeWrongDialog = true
                
            case 404:
                print("code: \(code)")
                showChildCodeWrongDialog = true
                
            default:
                print(error)
            }
            
        }
        
    }
    
    // login second
    func signUp() async {
        
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
        
        do {
            
            let _ = try await memberService.emailsVerificationRequest(email)
            
        } catch {
            print(error)
        }
        
    }
    
    // login last
    func emailsVerifications() async {
        
        do {
            let request = EmailsVerificationsRequest(email: email, code: code)
            let _ = try await memberService.emailsVerifications(request)
            
            isCorrectEmailCode = true
            
        } catch {
            print(error)
            isCorrectEmailCode = false
        }
        
    }
}
