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
    
    // MARK: global properties
    @Published var isFetching = false
    
    // MARK: first parent properties
    @Published var memberId: Int? = nil
    @Published var childCode: String = ""
    @Published var showDialog: Bool = false
    @Published var dialogMessage = ""
    
    
    // MARK: second parent properties
    @Published var email: String = ""
    @Published var pw: String = ""
    @Published var pwCheck: String = ""
    @Published var childName: String? = nil
    
    
    // MARK: third parent properties
    @Published var code: String = "" // 이메일 인증 코드
    enum EmailPhase {
        case none
        case sended
        case failure
    }
    @Published var emailPhase: EmailPhase = .none
    @Published var showWrongEmailDialog = false
    @Published var emailDialogMessage = ""
    
    // MARK: navigation link properties
    @Published var isCorrectChildCode: Bool = false // 학생 코드 인증 여부
    @Published var isCorrectSignUp = false // 1차 회원가입 여부
    
    // login first
    func verifyChildCode() async {
        isFetching = true
        defer { isFetching = false }
        var response: ResponseData<ChildCodeResponse>
        
        do {
            
            response = try await authService.verifyChildCode(childCode)
            
            memberId = response.data.memberId
            
            childName = try await memberService.getNameByChildCode(childCode: childCode).data.name
            
            isCorrectChildCode = response.data.isCorrectChildCode
        } catch {
            let code = error.code
            print(code)
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
                                            password: pw,
                                            fcmToken: fcmCache.getToken(of: .fcmToken),
                                            childCode: childCode,
                                            memberId: memberId)
                print(request)
                _ = try await authService.signUp(request)
                isCorrectSignUp = true
            } else {
                // handle error
                showDialog = true
                dialogMessage = "알 수 없는 에러가 발생했습니다"
            }
        } catch {
            showDialog = true
            dialogMessage = "알 수 없는 에러가 발생했습니다"
            debugPrint(error)
        }
        
    }
    
    // login third
    func emailsVerificationRequest() async {
        isFetching = true
        emailPhase = .sended
        emailDialogMessage = "알 수 없는 에러가 발생했습니다"
        defer { isFetching = false }
        do {
            _ = try await memberService.emailsVerificationRequest(email)
        } catch {
            debugPrint(error)
            let code = error.code
            if code == 409 {
                emailDialogMessage = "이미 해당 이메일은 사용중입니다"
            }
            showWrongEmailDialog = true
        }
    }
    
    // login last
    func emailsVerifications(onSuccess: @escaping (String, String) -> Void) async {
        isFetching = true
        emailDialogMessage = "인증 코드가 올바르지 않습니다"
        defer {
            isFetching = false
        }
        do {
            let request = EmailsVerificationsRequest(email: email, code: code)
            let response = try await memberService.emailsVerifications(request).data
            withAnimation {
                onSuccess(response.accessToken, response.refreshToken)
            }
        } catch {
            showWrongEmailDialog = true
            emailPhase = .failure
            debugPrint(error)
        }
    }
}
