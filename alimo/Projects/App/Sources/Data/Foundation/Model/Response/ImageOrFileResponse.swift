//
//  ImageResponse.swift
//  App
//
//  Created by dgsw8th71 on 3/4/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct ImageOrFileResponse: Decodable {
    let fileUrl: String
    let fileName: String
    let fileSize: Int // 단위: byte
    let filetype: String // 파일 확장자
    let imageOrFile: String
}

extension ImageOrFileResponse {
    func toDomain() -> ImageOrFile {
        ImageOrFile(fileUrl: fileUrl,
                    fileName: fileName,
                    fileSize: fileSize,
                    filetype: filetype,
                    imageOrFile: ImageOrFileType.fromString(imageOrFile))
    }
}
