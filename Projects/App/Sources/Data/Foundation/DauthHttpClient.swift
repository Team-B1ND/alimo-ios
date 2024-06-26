//
//  DodamHttpClient.swift
//  App
//
//  Created by dgsw8th36 on 2/14/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import Alamofire
import AlamofireImage
import Foundation
import UIKit

final class DauthHttpClient {
    
    private let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        let session = Session(configuration: configuration, eventMonitors: [apiLogger])
        return session
    }()
    
    func request<Parameters: Encodable,
                 Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod,
                                      parameters: Parameters? = nil,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await session.request(dodamUrl + url,
                             method: method,
                             parameters: parameters,
                             encoder: JSONParameterEncoder.default,
                             headers: headers)
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func request<Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod = .get,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await session.request(dodamUrl + url,
                             method: method,
                             headers: headers)
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func requestImage(_ url: String,
                      method: HTTPMethod = .get,
                      headers: HTTPHeaders? = nil) async throws -> UIImage {
        try await session.request(dodamUrl + url,
                             method: method,
                             headers: headers)
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
        try await session.upload(multipartFormData: multipartFormData,
                            to: dodamUrl + url,
                            usingThreshold: encodingMemoryThreshold,
                            method: method,
                            headers: headers).serializingDecodable(responseType).value
    }
    
}

extension DauthHttpClient {
    public static let live = DauthHttpClient()
}

