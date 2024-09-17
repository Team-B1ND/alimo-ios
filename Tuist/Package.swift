// swift-tools-version: 5.9
import PackageDescription

#if TUIST
import ProjectDescription
import ProjectDescriptionHelpers

let packageSettings = PackageSettings(
    baseSettings: .settings(
        base: .init(),
        configurations: [
            .debug(name: .debug),
            .release(name: .release)
        ],
        defaultSettings: .recommended
    ),
    projectOptions: [
        "LocalSwiftPackage": .options(disableSynthesizedResourceAccessors: false)
    ]
)
#endif

let package = Package(
    name: "Alimo",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.8.1"),
        .package(url: "https://github.com/Alamofire/AlamofireImage.git", exact: "4.3.0"),
        .package(url: "https://github.com/CSolanaM/SkeletonUI.git", exact: "2.0.1"),
        .package(url: "https://github.com/apple/swift-crypto.git", exact: "3.7.1"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", exact: "10.19.0"),
        .package(url: "https://github.com/google/GoogleUtilities.git", exact: "7.13.2"),
        .package(url: "https://github.com/Team-B1ND/ads-ios.git", exact: "0.2.4")
    ]
)
