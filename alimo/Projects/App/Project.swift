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
        ],
        "FirebaseAppDelegateProxyEnabled": .boolean(false),
        "UIBackgroundModes": ["fetch", "remote-notification"],
        "NSPhotoLibraryUsageDescription": "알리모에서 이미지를 저장하려면 '사진'에 접근해야 합니다.",
        "NSDocumentsFolderUsageDescription": "알리모에서 파일을 저장하려면 '파일'에 접근해야 합니다.",
        "UIFileSharingEnabled": .boolean(true),
        "LSSupportsOpeningDocumentsInPlace": .boolean(true),
        "CFBundleDisplayName": "알리모"
    ])
)
