//
//  BottomNavigationType.swift
//  App
//
//  Created by dgsw8th71 on 2/25/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

enum BottomNavigationType: CaseIterable {
    case home
    case bookmark
    case my
    
    var text: String {
        switch self {
        case .home: "홈"
        case .bookmark: "북마크"
        case .my: "MY"
        }
    }
    
    var image: String {
        switch self {
        case .home: "Home"
        case .bookmark: "Bookmark"
        case .my: "Profile"
        }
    }
}
