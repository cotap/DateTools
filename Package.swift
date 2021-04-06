// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "DateToolsSwift",
    platforms: [
        .iOS(.v9),
        .tvOS(.v9),
        .macOS(.v10_10),
        .watchOS(.v2)
    ],
    products: [
        .library(name: "DateToolsSwift", targets: ["DateToolsSwift"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "DateToolsSwift",
                path: "DateToolsSwift/DateTools",
                resources: [.copy("DateTools.bundle")]),
        .testTarget(
            name: "DateToolsSwiftTests",
            dependencies: ["DateToolsSwift"],
            path: "DateToolsSwift/Tests/DateToolsTests/DateToolsTestsTests")
    ]
)
