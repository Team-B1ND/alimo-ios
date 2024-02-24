//
//  DefaultInterceptor.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Alamofire
import Foundation

fileprivate let authService = AuthService.live
fileprivate let authCache = AuthCache.live

class DefaultInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var modifiedRequest = urlRequest
        modifiedRequest.setValue("Bearer " + authCache.getToken(of: .accessToken), forHTTPHeaderField: "Authorization")
        
        completion(.success(modifiedRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        let refreshToken = authCache.getToken(of: .refreshToken)
        let request = RefreshRequest(refreshToken: refreshToken)
        Task {
            do {
                let response = try await authService.refresh(request)
                authCache.saveToken(response.data.accessToken, to: .accessToken)
                completion(.retry)
            } catch {
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
