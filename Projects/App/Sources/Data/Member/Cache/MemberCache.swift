//
//  MemberCache.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


final class MemberCache {
    
    private struct Key {
        static let isAlarmOn = "isAlarmOn"
    }
    private init() {}
    
    func getIsAlarmOn() -> Bool {
        UserDefaults.standard.bool(forKey: Key.isAlarmOn)
    }
    
    func saveIsAlarmOn(_ isAlarmOn: Bool) {
        UserDefaults.standard.set(isAlarmOn, forKey: Key.isAlarmOn)
    }
}

extension MemberCache {
    static let live = MemberCache()
}
