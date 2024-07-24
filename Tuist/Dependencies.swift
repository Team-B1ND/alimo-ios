import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init(
        [
            .remote(url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.8.1")),
            .remote(url: "https://github.com/Alamofire/AlamofireImage.git",
                    requirement: .upToNextMajor(from: "4.3.0")),
            .remote(url: "https://github.com/CSolanaM/SkeletonUI.git", requirement: .exact("2.0.1")),
            .remote(url: "https://github.com/apple/swift-crypto.git", requirement: .upToNextMajor(from: "3.0.0")),
            .remote(url: "https://github.com/firebase/firebase-ios-sdk", requirement: .exact("10.19.0")),
            .remote(url: "https://github.com/Team-B1ND/ads-ios.git", requirement: .exact("0.1.1")),
        ]
    ),
    platforms: [.iOS]
)
