//
//  Image.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct ImageOrFile: Hashable {
    var fileId: Int
    var fileUrl: String
    var fileName: String
    var fileType: String
    var imageOrFile: ImageOrFileType?
}
