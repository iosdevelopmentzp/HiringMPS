//
//  PeopleCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import DependencyResolver
import UIKit
import ScenePeople

final class PeopleCoordinator: NavigationCoordinator {
    private let resolver: DependencyResolverProtocol
    
    init(_ resolver: DependencyResolverProtocol, navigation: UINavigationController) {
        self.resolver = resolver
        super.init(navigation: navigation)
    }
    
    override func start() {
        let viewModel = PeopleViewModel(resolver.resolve())
        viewModel.sceneDelegate = self
        let view = PeopleViewController(viewModel)
        navigation.pushViewController(view, animated: true)
    }
}

// MARK: - RoomsSceneDelegate

extension PeopleCoordinator: PeopleSceneDelegate {
    // Handle RoomsModule navigations events
}

