// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "MonoCore",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "MonoCore",
            targets: ["MonoCore"]),
    ],
    targets: [
        .target(
            name: "MonoCore"),
        .testTarget(
            name: "MonoCoreTests",
            dependencies: ["MonoCore"]
        ),
    ]
)
