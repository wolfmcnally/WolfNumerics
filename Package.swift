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
        .target(
            name: "Demo",
            dependencies: ["WolfNumerics"]),
        .testTarget(
            name: "Tests",
            dependencies: ["WolfNumerics"]),
        ],
    swiftLanguageVersions: [.v4_2]
)
