// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "mqtt-nio",
    platforms: [.macOS(.v10_15), .iOS(.v15), .tvOS(.v15), .watchOS(.v6)],
    products: [
        .library(name: "MQTTNIO", targets: ["MQTTNIO"]),
        .library(name: "MQTTNIO-Dynamic", type: .dynamic, targets: ["MQTTNIO"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "2.40.0"),
        .package(url: "https://github.com/apple/swift-nio-transport-services.git", from: "1.6.0"),
    ],
    targets: [
        .target(name: "MQTTNIO", dependencies: [
            .product(name: "Logging", package: "swift-log"),
            .product(name: "NIO", package: "swift-nio"),
            .product(name: "NIOConcurrencyHelpers", package: "swift-nio"),
            .product(name: "NIOHTTP1", package: "swift-nio"),
            .product(name: "NIOWebSocket", package: "swift-nio"),
            .product(name: "NIOTransportServices", package: "swift-nio-transport-services"),
        ]),
        .testTarget(name: "MQTTNIOTests", dependencies: ["MQTTNIO"]),
    ]
)
