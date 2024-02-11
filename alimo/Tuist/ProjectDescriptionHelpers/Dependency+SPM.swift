import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let AlamofireImage = TargetDependency.external(name: "AlamofireImage")
    static let SkeletonUI = TargetDependency.external(name: "SkeletonUI")
}
