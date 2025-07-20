// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PokemonTerminalGame",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "PokemonTerminalGame", targets: ["PokemonTerminalGame"]),
    ],
    targets: [
        .executableTarget(
            name: "PokemonTerminalGame",
            path: "Sources/PokemonTerminalGame"
        ),
        .testTarget(
            name: "PokemonTerminalGameTests",
            dependencies: ["PokemonTerminalGame"],
            path: "Tests/PokemonTerminalGameTests"
        ),
    ]
)
