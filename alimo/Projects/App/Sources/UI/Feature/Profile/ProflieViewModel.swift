//
//  ProflieViewModel.swift
//  App
//
//  Created by dgsw8th36 on 2/15/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate let memberCache = MemberCache.live

@MainActor
class ProfileViewModel: ObservableObject {
    
    private let memberService = MemberService.live
    
    @Published var memberInfo: Member? = nil
    @Published var categoryList: [String] = []
    @Published var isAlarmOn: Bool = memberCache.getIsAlarmOn() {
        didSet {
            memberCache.saveIsAlarmOn(isAlarmOn)
            Task {
                await setAlarm(isAlarmOff: !isAlarmOn)
            }
        }
    }
    
    private func setAlarm(isAlarmOff: Bool) async {
    
        do {
            
            _ = try await memberService.alarmOnOff(isOffAlarm: isAlarmOff)
            print("ProfileVM - isAlarmOff - \(isAlarmOff)")
        } catch {
            debugPrint(error)
        }
        
    }
    
    func fetchInfo() async {
        do {
            memberInfo = try await memberService.getMemberInfo()
            dump(memberInfo)
            
            guard let memberInfo else { return }
            
            isAlarmOn = !memberInfo.isOffAlarm
        } catch {
            debugPrint(error)
        }
    }
    
    func fetchCategoryList() async {
        do {
            let roles = try await memberService.getCategoryList().data.roles
            categoryList = roles
            debugPrint(roles)
        } catch {
            debugPrint(error)
        }
    }
}
