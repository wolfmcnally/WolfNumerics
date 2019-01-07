// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "WolfNumerics",
    products: [
        .library(
            name: "WolfNumerics",
            targets: ["WolfNumerics"]),
        ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "WolfNumerics",
            dependencies: []),
        .testTarget(
            name: "Tests",
            dependencies: ["WolfNumerics"]),
        ]
)
