//
//  TingNotificationImageResponse.swift
//  App
//
//  Created by dgsw8th61 on 2/23/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct TingNotificationImageResponse: Decodable {
    let fileId: Int
    let fileUrl, fileName: String
    let fileSize: Int
    let fileType: String
}
