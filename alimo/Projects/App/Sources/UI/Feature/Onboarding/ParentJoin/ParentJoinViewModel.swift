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
    
    // 학부모 정보
    @Published var memberInfo: Member? = nil
    
    // 부모님 이메일, 비밀번호
    @Published var email: String = ""
    @Published var password: String = ""
    
    // 학생 코드
    @Published var childCode: String = ""
    
    // 학생 코드 인증 여부
    @Published var isCorrectChildCode: Bool = false
    
    // dialog on/off 변수
    @Published var showChildCodeWrongDialog: Bool? = false
    
    // 이메일 인증 코드
    @Published var code: String = ""
    
    // 이메일 인증 여부
    @Published var isCorrectEmailCode: Bool = false
    
    func signUp() async {
        
        do {
            
            let _ = try await authService.signUp(SignUpRequest(email: email, password: password, fcmToken: fcmCache.getToken(of: .fcmToken), childCode: childCode, memberId: memberInfo?.memberId ?? -1))
            
        } catch {
            
        }
        
    }
    
    func emailsVerificationRequest() async {
        
        do {
            
            let _ = try await memberService.emailsVerificationRequest(memberService.getMemberInfo().email)
            
        } catch {
            
        }
        
    }
    
    func emailsVerifications() async {
        
        do {
            
            let _ = try await memberService.emailsVerifications(EmailsVerificationsRequest(email: memberService.getMemberInfo().email, code: code))
            
            isCorrectEmailCode = true
            
        } catch {
            
        }
        
    }
    
    func getInfo() async {
        
        do {
            
            memberInfo = try await memberService.getMemberInfo()
            
        } catch {
            
            print(error)
            
        }
        
    }
    
    func verifyChildCode() async {
        
        var response: ResponseData<ChildCodeResponse>
        
        do {
            
            response = try await authService.verifyChildCode(childCode)
            
            isCorrectChildCode = response.data.isCorrectChildCode
            memberInfo?.memberId = response.data.memberId
            
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
    
}
