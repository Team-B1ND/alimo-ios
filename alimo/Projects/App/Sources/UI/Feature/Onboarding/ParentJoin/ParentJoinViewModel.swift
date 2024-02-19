//
//  ParentJoinViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

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
    @Published var showChildCodeWrongDialog: Bool = false
    
    // 이메일 인증 코드
    @Published var code: String = ""
    
    func signUp() async {
        
        do {
            
            // fcmToken이랑 memberId 어디서 가져오는지 모르겠어요
            let _ = try await authService.signUp(SignUpRequest(email: email, password: password, fcmToken: "", childCode: childCode, memberId: 0))
            
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
            
        } catch {
            
        }
        
    }
    
    func getInfo() async {
        
        do {
            
            memberInfo = try await memberService.getMemberInfo()
            
        } catch {
            
        }
        
    }
    
    func verifyChildCode() async {
        
        do {
            
//            isCorrectChildCode = try await authService.verifyChildCode(childCode).data.isCorrectChildCode
            isCorrectChildCode = try await authService.verifyChildCode("PcpVD3").data.isCorrectChildCode
            
            showChildCodeWrongDialog = isCorrectChildCode
            
        } catch {
            print(error)
        }
        
    }
}
