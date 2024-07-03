// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SQLCipher",
    products: [
        .library(
            name: "SQLCipher",
            targets: ["SQLCipher"]),
    ],
    targets: [
        .target(
            name: "SQLCipher",
            cSettings:[
                .define("SQLITE_HAS_CODEC", to: "1"),
                .define("SQLITE_TEMP_STORE", to: "3"),
                .define("SQLCIPHER_CRYPTO_CC", to: nil),
                .define("NDEBUG", to: "1")
            ]
            // we should probably link against the system's Foundation and Security libraries, but when
            // importing the SQLCipher module, we get linker errors in our app in Xcode.

            // linkerSettings: [
            //     .linkedFramework("Foundation"),
            //     .linkedLibrary("Security")
            // ]
        )
    ]
)
