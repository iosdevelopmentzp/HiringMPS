// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HiringApp",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "Extensions", targets: ["Extensions"]),
        .library(name: "RxExtensions", targets: ["RxExtensions"]),
        .library(name: "MVVM", targets: ["MVVM"]),
        .library(name: "Core", targets: ["Core"]),
        .library(name: "Networking", targets: ["Networking"]),
        .library(name: "UseCases", targets: ["UseCases"]),
        .library(name: "Assemblies", targets: ["Assemblies"]),
        .library(name: "DependencyResolver", targets: ["DependencyResolver"]),
        .library(name: "HiringApp", targets: ["HiringApp"]),
        .library(name: "SharedViews", targets: ["SharedViews"]),
        .library(name: "Animators", targets: ["Animators"]),
        
        // scenes
        
        .library(name: "SceneRooms", targets: ["SceneRooms"]),
        .library(name: "ScenePeople", targets: ["ScenePeople"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", exact: "5.6.0"),
        .package(url: "https://github.com/onevcat/Kingfisher", exact: "7.0.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", exact: "2.8.0"),
        
        // Rx
                
        .package(url: "https://github.com/ReactiveX/RxSwift.git", exact: "6.5.0"),
        .package(url: "https://github.com/RxSwiftCommunity/RxAlamofire.git",
                 exact: "6.1.2"),
        .package(url: "https://github.com/RxSwiftCommunity/RxDataSources.git", exact: "5.0.2")
    ],
    targets: [
        .target(name: "Extensions"),
        
        .target(name: "RxExtensions", dependencies: [
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift")
        ]),
        
        .target(name: "MVVM"),
        
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
            "DependencyResolver",
            "SceneRooms",
            "ScenePeople",
            "SharedViews"
        ]),
        
        .target(name: "SharedViews", dependencies: [
            "Extensions",
            "SnapKit",
            "Animators"
        ]),
        
        .target(name: "Animators"),
        
        // scenes
        
        .target(name: "SceneRooms", dependencies: [
            "UseCases",
            "Core",
            "MVVM",
            "Extensions",
            "SnapKit",
            "RxDataSources",
            "SharedViews",
            "RxExtensions",
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift")
        ]),
        
        .target(name: "ScenePeople", dependencies: [
            "UseCases",
            "Core",
            "MVVM",
            "Extensions",
            "SnapKit",
            "RxDataSources",
            "SharedViews",
            "RxExtensions",
            .product(name: "RxSwift", package: "RxSwift"),
            .product(name: "RxCocoa", package: "RxSwift")
        ])
    ]
)
