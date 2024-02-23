//
//  BaseResponse.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation

struct Response: Decodable {
    let status: Int
    let message: String
}

struct ResponseData<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T
}

struct HomeResponseData<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: [T]
}
