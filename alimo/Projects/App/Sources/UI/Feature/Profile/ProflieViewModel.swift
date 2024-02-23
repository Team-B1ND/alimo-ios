//
//  ProflieViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    
    private let memberService = MemberService.live
    private let memberCache = MemberCache.live
    
//    private let 
    
    @Published var memberInfo: Member? = nil
    
    @Published var categoryList: [String] = [""]
    
    @Published var isAlarmOn: Bool {
        didSet {
            memberCache.saveIsAlarmOn(isAlarmOn)
//            Task {
//                await alarmOnOff()
//            }
        }
    }
    
    init() {
        self.isAlarmOn = memberCache.getIsAlarmOn()
    }
    
    func alarmOnOff() async {
    
        do {
            
            let _ = try await memberService.alarmOnOff()
            
        } catch {
            
        }
        
    }
    
    func getInfo() async {
        
        do {
            
            memberInfo = try await memberService.getMemberInfo()
            dump(memberInfo)
            
        } catch {
            debugPrint(error)
        }
        
    }
    
    func getCategoryList() async {
    
        do {
            
            let roles = try await memberService.getCategoryList()
            categoryList = roles.data.roles
            
        } catch {
            
        }
        
    }
    
}
