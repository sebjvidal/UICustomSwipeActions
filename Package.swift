// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "UICustomSwipeActions",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "UICustomSwipeActions",
            targets: ["UICustomSwipeActions"]
        ),
    ],
    targets: [
        .target( name: "UICustomSwipeActions")
    ]
)
