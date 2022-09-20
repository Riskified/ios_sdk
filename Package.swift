// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RiskifiedBeacon",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RiskifiedBeacon",
            targets: ["RiskifiedBeacon"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
    
        .binaryTarget(
            name: "RiskifiedBeacon",
            path: "RiskifiedBeacon.xcframework"
            //url: "https://github.com/Riskified/ios_sdk/raw/a8a4a4875e436026eb4d0473dc488d1579eb52e6/RiskifiedBeacon.xcframework.zip",
            //checksum: "5e0cb1b671b7847db1d852192a3587d12acc35884681be908eac100dc149af8f"

        )
    ]
)
