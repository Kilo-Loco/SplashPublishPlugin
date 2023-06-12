// swift-tools-version:5.6

/**
*  Splash-plugin for Publish
*  Copyright (c) John Sundell 2019
*  MIT license, see LICENSE file for details
*/

import PackageDescription

let package = Package(
    name: "SplashPublishPlugin",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SplashPublishPlugin",
            targets: ["SplashPublishPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.5.0"),
        .package(url: "https://github.com/kilo-loco/splash.git", branch: "dev")
    ],
    targets: [
        .target(
            name: "SplashPublishPlugin",
            dependencies: [
                .product(name: "Publish", package: "publish"),
                .product(name: "Splash", package: "splash")
            ]
        ),
        .testTarget(
            name: "SplashPublishPluginTests",
            dependencies: ["SplashPublishPlugin"]
        ),
    ]
)
