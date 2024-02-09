//
//  AlimoHttpClient.swift
//  App
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Alamofire
import Foundation
import UIKit

final class AlimoHttpClient {
    func request<Parameters: Encodable,
                 Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod,
                                      parameters: Parameters? = nil,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await AF.request(baseUrl + url,
                             method: method,
                             parameters: parameters,
                             encoder: JSONParameterEncoder.default,
                             headers: headers,
                             interceptor: DefaultInterceptor())
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func request<Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod = .get,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await AF.request(baseUrl + url,
                             method: method,
                             headers: headers,
                             interceptor: DefaultInterceptor())
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func requestImage(_ url: String,
                      method: HTTPMethod = .get,
                      headers: HTTPHeaders? = nil) async throws -> UIImage {
        try await AF.request(baseUrl + url,
                             method: method,
                             headers: headers,
                             interceptor: DefaultInterceptor())
        .validate()
        .serializingImage().value
    }
    
    func upload<Response: Decodable>(multipartFormData: @escaping (MultipartFormData) -> Void,
                                     to url: String,
                                     _ responseType: Response.Type = VoidResponse.self,
                                     usingThreshold encodingMemoryThreshold: UInt64 = MultipartFormData.encodingMemoryThreshold,
                                     method: HTTPMethod = .post,
                                     headers: HTTPHeaders? = nil,
                                     interceptor: RequestInterceptor? = nil,
                                     fileManager: FileManager = .default) async throws -> Response {
        try await AF.upload(multipartFormData: multipartFormData,
                            to: baseUrl + url,
                            usingThreshold: encodingMemoryThreshold,
                            method: method,
                            headers: headers,
                            interceptor: DefaultInterceptor()).serializingDecodable(responseType).value
    }
    
}

extension AlimoHttpClient {
    public static let live = AlimoHttpClient()
}
