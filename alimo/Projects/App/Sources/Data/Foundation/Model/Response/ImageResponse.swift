//
//  ImageResponse.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct ImageResponse: Decodable {
    let fileId: Int
    let fileUrl: String
    let fileName: String
    let fileType: String
    let imageOrFile: String
}

extension ImageResponse {
    func toDomain() -> Image {
        Image(fileId: fileId,
              fileUrl: fileUrl,
              fileName: fileName,
              fileType: fileType,
              imageOrFile: ImageOrFile.fromString(imageOrFile))
    }
}
