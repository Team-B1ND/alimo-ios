import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let AlamofireImage = TargetDependency.external(name: "AlamofireImage")
    static let SkeletonUI = TargetDependency.external(name: "SkeletonUI")
    static let SwiftCrypto = TargetDependency.external(name: "Crypto")
    static let FirebaseAnalytics = TargetDependency.external(name: "FirebaseAnalytics")
    static let FirebaseCrashlytics = TargetDependency.external(name: "FirebaseCrashlytics")
    static let FirebaseMessaging = TargetDependency.external(name: "FirebaseMessaging")
    static let Nuke = TargetDependency.external(name: "Nuke")
    static let NukeUI = TargetDependency.external(name: "NukeUI")
}
