// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WolfNumerics",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfNumerics",
            type: .dynamic,
            targets: ["WolfNumerics"]),
        ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "WolfNumerics",
            dependencies: []),
        .testTarget(
            name: "WolfNumericsTests",
            dependencies: ["WolfNumerics"]),
        ]
)
