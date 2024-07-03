// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapacitorCommunitySqlite",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "CapacitorSQLitePlugin",
            targets: ["CapacitorSQLitePlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", branch: "main"),
        .package(name: "SQLCipher", path: "SQLCipher/"),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.0"))
    ],
    targets: [
        .target(
            name: "CapacitorSQLitePlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "SQLCipher", package: "SQLCipher"),
                .product(name: "ZIPFoundation", package: "ZIPFoundation")
            ],
            path: "ios/Plugin"),
        .testTarget(
            name: "CapacitorSQLitePluginTests",
            dependencies: ["CapacitorSQLitePlugin"],
            path: "ios/PluginTests")
    ]
)