// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "uprefs",
    products: [
        .executable(name: "uprefs", targets: ["uprefs"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.0.0"))
    ],
    targets: [
        .executableTarget(
            name: "uprefs",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Rainbow"
            ]),
        .testTarget(
            name: "uprefsTests",
            dependencies: ["uprefs"]),
    ]
)
