//
//  Regex.swift
//  App
//
//  Created by dgsw8th71 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct Regex {
    static func validatePassword(_ input: String) -> Bool {
        let pattern = #"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*()_+={}\[\]:;,<.>/?]).{5,18}$"#
        let regex = try! NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: input.utf16.count)
        return regex.firstMatch(in: input, options: [], range: range) != nil
    }
}
