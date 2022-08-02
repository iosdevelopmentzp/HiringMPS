// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HiringApp",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "UseCases", targets: ["UseCases"]),
        .library(name: "Assemblies", targets: ["Assemblies"]),
        .library(name: "DependencyResolver", targets: ["DependencyResolver"]),
        .library(name: "HiringApp", targets: ["HiringApp"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.6.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", exact: "7.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.0"),
        
        // Rx
                
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git",
                 exact: "6.1.2")
    ],
    targets: [
        .target(name: "Core"),
        
        .target(name: "Networking", dependencies: [
            "Core",
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift"),
            "RxAlamofire"
        ]),
        
        .target(name: "UseCases", dependencies: [
            "Networking",
            "Core",
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift")
        ]),
        
        .target(name: "Assemblies", dependencies: [
            "Swinject",
            "Networking",
            "UseCases"
        ]),
        
        .target(name: "DependencyResolver", dependencies: [
            "Swinject"
        ]),
        
        .target(name: "HiringApp", dependencies: [
            "DependencyResolver"
        ])
    ]
)
