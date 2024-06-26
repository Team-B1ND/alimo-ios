//
//  FcmCache.swift
//  App
//
//  Created by dgsw8th36 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

final class FcmCache {
    
    private init() {}
    
    func getToken(of key: FcmTokenKey) -> String {
        UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func saveToken(_ token: String, to key: FcmTokenKey) {
        UserDefaults.standard.set(token, forKey: key.rawValue)
    }
    
    func removeToken(of key: FcmTokenKey) {
        UserDefaults.standard.set("", forKey: key.rawValue)
    }
    
}

extension FcmCache {
    static let live = FcmCache()
}
