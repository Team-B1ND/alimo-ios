//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/6/24.
//

import ProjectDescription
import ProjectDescriptionHelpers


let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .SPM.Alamofire,
        .SPM.AlamofireImage,
        .SPM.SkeletonUI,
        .SPM.SwiftCrypto,
        .SPM.FirebaseAnalytics,
        .SPM.FirebaseCrashlytics,
        .SPM.FirebaseMessaging
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
        "UIUserInterfaceStyle":"Light",
        "NSAppTransportSecurity": [
            "NSAllowsArbitraryLoads": .boolean(true)
        ]
    ])
)
