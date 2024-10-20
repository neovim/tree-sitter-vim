// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterVim",
    products: [
        .library(name: "TreeSitterVim", targets: ["TreeSitterVim"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterVim",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                "src/scanner.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterVimTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterVim",
            ],
            path: "bindings/swift/TreeSitterVimTests"
        )
    ],
    cLanguageStandard: .c11
)
