//
//  Constant.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import Foundation

public let dummyText = "Alimo!"
public let appName = "Alimo"

var version: String? {
    guard let dictionary = Bundle.main.infoDictionary,
        let version = dictionary["CFBundleShortVersionString"] as? String else { return nil }

    return version
}

var build: String? {
    guard let dictionary = Bundle.main.infoDictionary,
        let build = dictionary["CFBundleVersion"] as? String else { return nil }

    return build
}

public let pagingInterval = 15
