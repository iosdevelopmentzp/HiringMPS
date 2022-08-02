//
//  AppCoordinator+Launch.swift
//  HiringMPS
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import HiringApp
import UIKit
import DependencyResolver
import Assemblies

extension AppCoordinator {
    static func launch(with window: UIWindow) -> AppCoordinator {
        return AppCoordinator(window: window, resolver: setupDependencyResolver())
    }
    
    private static func setupDependencyResolver() -> DependencyResolverProtocol {
        let resolver = DependencyResolver()
        
        let assemblyFactory = AssembliesFactory()
        
        resolver.append(assemblies: [
            assemblyFactory.useCases,
            assemblyFactory.networking,
            assemblyFactory.apiConfiguration(APIConfiguration.decoded())
        ])
        return resolver
    }
}
