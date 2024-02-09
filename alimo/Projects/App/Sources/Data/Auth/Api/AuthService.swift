import Alamofire

fileprivate let client = AlimoHttpClient.live

final class AuthService {
    
    private let path = "/sign-in"
    
    func signInTest(_ email: String) async throws -> SignInResponse {
        try await client.request("\(path)/test?email=\(email)",
                                 SignInResponse.self,
                                 method: .post)
    }
    
    func signIn(_ request: SignInRequest) async throws -> SignInResponse {
        try await client.request("\(path)/",
                                 SignInResponse.self,
                                 method: .post, 
                                 parameters: request)
    }
    
}

extension AuthService {
    static let live = AuthService()
}
