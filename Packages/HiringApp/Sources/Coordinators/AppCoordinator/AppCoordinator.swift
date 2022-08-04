//
//  AppCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import UIKit
import DependencyResolver
import AppDesign

public final class AppCoordinator: NavigationCoordinator {
    // MARK: - Properties
    
    private let window: UIWindow
    
    private let resolver: DependencyResolverProtocol
    
    // MARK: - Constructor
    
    public init(window: UIWindow, resolver: DependencyResolverProtocol) {
        self.window = window
        self.resolver = resolver
        let navigationController = UINavigationController()
        navigationController.view.backgroundColor = .white
        super.init(navigation: navigationController)
    }
    
    // MARK: - Constructor
    
    public override func start() {
        setupAppearance()
        
        window.rootViewController = navigation
        let tabBarCoordinator = TabBarCoordinator(resolver, navigation: navigation)
        addChild(tabBarCoordinator)
        tabBarCoordinator.start()
        window.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func setupAppearance() {
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.tintColor = Colors.appAccent
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor.white,
                .font: UIFont.systemFont(ofSize: 18, weight: .bold)
            ]
            appearance.backgroundColor = Colors.appAccent
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } else {
            UINavigationBar.appearance().backgroundColor = Colors.appAccent
        }
    }
}
