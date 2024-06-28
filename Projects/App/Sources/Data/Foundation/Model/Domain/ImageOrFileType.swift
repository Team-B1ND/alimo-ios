//
//  ImageOrFile.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

enum ImageOrFileType: String, CaseIterable {
    case image = "IMAGE"
    case file = "FILE"
    
    static func fromString(_ str: String) -> ImageOrFileType? {
        var result: ImageOrFileType?
        ImageOrFileType.allCases.forEach {
            if $0.rawValue == str {
                result = $0
            }
        }
        return result
    }
}
