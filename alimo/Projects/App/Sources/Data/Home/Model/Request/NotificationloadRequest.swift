//
//  NotificationloadRequest.swift
//  App
//
//  Created by dgsw8th61 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

//MARK: -
struct NotificationloadRequest : Encodable {
    let pageRequest : Page
    let category : String
}

// MARK: - Page
struct Page: Encodable {
    let page, size: Int
}
