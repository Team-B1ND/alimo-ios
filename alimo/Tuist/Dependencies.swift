import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: [],
    swiftPackageManager: .init(
        [
            .remote(
                url: "https://github.com/Alamofire/Alamofire.git",
                requirement: .upToNextMajor(from: "5.8.1")
            )
        ]
    ),
    platforms: [.iOS]
)
