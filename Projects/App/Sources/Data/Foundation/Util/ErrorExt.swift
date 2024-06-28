//
//  ErrorExt.swift
//  App
//
//  Created by dgsw8th36 on 2/22/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Foundation
import Alamofire

extension Error {
    
    var code: Int {
        if let afError = self as? AFError {
            switch afError {
            case .responseValidationFailed(let reason):
                switch reason {
                case .unacceptableStatusCode(let code):
                    return code
                default: return -1
                }
            default: return -1
            }
        }
        return -1
    }

}
