//
//  DefaultInterceptor.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Alamofire
import Foundation

class DefaultInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
//        print(urlRequest.headers)
//        var modifiedRequest = urlRequest
//        modifiedRequest.setValue("Bearer " + (UserDefaults.standard.string(forKey: "accessToken") ?? ""), forHTTPHeaderField: "Authorization")
        
        completion(.success(urlRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        // add condition & to refresh
        
        completion(.doNotRetry)
    }
}
