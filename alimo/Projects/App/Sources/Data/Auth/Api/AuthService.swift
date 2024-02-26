import Alamofire

fileprivate let client = AlimoHttpClient.live
fileprivate let dauthClient = DauthHttpClient.live

final class AuthService {
    
    private let signInPath = "/sign-in"
    private let refreshPath = "/refresh"
    private let childCodePath = "/verify-childCode"
    private let signUpPath = "/sign-up"
    private let dauthTokenPath = "/auth/login/"
    
    func signInTest(_ email: String) async throws -> ResponseData<TokenResponse> {
        try await client.request("\(signInPath)/test?email=\(email)",
                                 ResponseData<TokenResponse>.self,
                                 method: .post)
    }
    
    func signIn(_ request: SignInRequest) async throws -> ResponseData<TokenResponse> {
        try await client.request("\(signInPath)",
                                 ResponseData<TokenResponse>.self,
                                 method: .post,
                                 parameters: request)
    }
    
    func signInByDodam(_ request: DodamSignInRequest) async throws -> ResponseData<TokenResponse> {
        try await client.request("\(signInPath)/dodam", 
                                 ResponseData<TokenResponse>.self,
                                 method: .post, parameters: request)
    }
    
    func refresh(_ request: RefreshRequest) async throws -> ResponseData<RefreshResponse> {
        try await AF.request(baseUrl + "/refresh",
                             method: .post,
                             parameters: request,
                             encoder: JSONParameterEncoder.default)
        .validate()
        .serializingDecodable(ResponseData<RefreshResponse>.self).value
    }
    
    func verifyChildCode(_ childCode: String) async throws -> ResponseData<ChildCodeResponse> {
        try await client.request("\(childCodePath)?child-code=\(childCode)",
                                 ResponseData<ChildCodeResponse>.self,
                                 method: .post)
    }
    
    func signUp(_ request: SignUpRequest) async throws -> Response {
        try await client.request("\(signUpPath)",
                                 Response.self,
                                 method: .post,
                                 parameters: request)
    }
    
    func dodamToken(_ request: DodamTokenRequest) async throws -> ResponseData<TokenResponse> {
        try await client.request("\(signInPath)/dodam",
                                 ResponseData<TokenResponse>.self,
                                 method: .post,
                                 parameters: request)
    }
    
    func dauthToken(_ request: DauthTokenRequest) async throws -> ResponseData<DauthTokenResponse> {
        try await dauthClient.request("\(dauthTokenPath)",
                                 ResponseData<DauthTokenResponse>.self,
                                 method: .post,
                                 parameters: request)
    }
}

extension AuthService {
    static let live = AuthService()
}
