//
//  ImageResponse.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct ImageOrFileResponse: Decodable {
    let fileId: Int
    let fileUrl: String
    let fileName: String
    let fileType: String
    let imageOrFile: String
}

extension ImageOrFileResponse {
    func toDomain() -> ImageOrFile {
        ImageOrFile(fileId: fileId,
              fileUrl: fileUrl,
              fileName: fileName,
              fileType: fileType,
              imageOrFile: ImageOrFileType.fromString(imageOrFile))
    }
}
