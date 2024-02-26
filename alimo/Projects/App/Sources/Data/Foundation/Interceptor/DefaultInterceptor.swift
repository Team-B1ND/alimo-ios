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
        
        debugPrint(request)
        
        guard let response = request.task?.response as? HTTPURLResponse, response.statusCode == 403 else {
            completion(.doNotRetryWithError(error))
            return
        }
        
        let refreshToken = authCache.getToken(of: .refreshToken)
        let request = RefreshRequest(refreshToken: refreshToken)
        
        print("refreshToken - \(refreshToken)")
        
        Task {
            do {
                let response = try await authService.refresh(request)
                print("-- refreshed --")
                print(response)
                authCache.saveToken(response.data.accessToken, to: .accessToken)
                completion(.retry)
            } catch {
                print("-- lost session --")
                completion(.doNotRetryWithError(error))
            }
        }
    }
}
