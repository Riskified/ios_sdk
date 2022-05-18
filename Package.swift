// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RiskifiedBeacon",
    platforms: [ .iOS(.v9) ],
    products: [
        .library(name: "RiskifiedBeacon", targets: ["RiskifiedBeacon"])
    ],
    targets: [
        .binaryTarget(name: "RiskifiedBeacon", path: "./RiskifiedBeacon.xcframework")
    ]
)
