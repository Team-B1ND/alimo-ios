//
//  AuthCache.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation


final class AuthCache {
    
    private init() {}
    
    func getToken(of key: TokenKey) -> String {
        UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func saveToken(_ token: String, to key: TokenKey) {
        UserDefaults.standard.set(token, forKey: key.rawValue)
    }
    
    func removeToken(of key: TokenKey) {
        UserDefaults.standard.set("", forKey: key.rawValue)
    }
    
}

extension AuthCache {
    static let live = AuthCache()
}
