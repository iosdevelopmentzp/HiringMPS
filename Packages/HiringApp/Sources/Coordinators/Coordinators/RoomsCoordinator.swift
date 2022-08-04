//
//  RoomsCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import DependencyResolver
import UIKit
import SceneRooms

final class RoomsCoordinator: NavigationCoordinator {
    private let resolver: DependencyResolverProtocol
    
    init(_ resolver: DependencyResolverProtocol, navigation: UINavigationController) {
        self.resolver = resolver
        super.init(navigation: navigation)
    }
    
    override func start() {
        let viewModel = RoomsViewModel(resolver.resolve())
        viewModel.sceneDelegate = self
        let view = RoomsViewController(viewModel)
        navigation.pushViewController(view, animated: true)
    }
}

// MARK: - RoomsSceneDelegate

extension RoomsCoordinator: RoomsSceneDelegate {
    // Handle RoomsModule navigations events
}
