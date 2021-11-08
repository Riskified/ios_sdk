// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "RiskifiedBeacon",
    platforms: [ .iOS(.v13) ],
    products: [
        .library(
            name: "RiskifiedBeacon",
            targets: [ "RiskifiedBeacon" ]),
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "RiskifiedBeacon",
            path: "RiskifiedBeacon.xcframework"),
    ]
)
