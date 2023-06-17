// swift-tools-version:5.6

/**
*  Splash plugin for Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "SplashPublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "SplashPublishPlugin",
            targets: ["SplashPublishPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/Publish.git", from: "0.9.0"),
        .package(url: "https://github.com/kilo-loco/Splash.git", branch: "v2")
    ],
    targets: [
        .target(
            name: "SplashPublishPlugin",
            dependencies: ["Splash", "Publish"]
        ),
        .testTarget(
            name: "SplashPublishPluginTests",
            dependencies: ["SplashPublishPlugin"]
        ),
    ]
)
