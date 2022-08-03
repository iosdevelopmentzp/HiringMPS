//
//  TabBarCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import DependencyResolver

final class TabBarCoordinator: NavigationCoordinator {
    private let tabBarController: UITabBarController
    private let resolver: DependencyResolverProtocol
    
    init(_ resolver: DependencyResolverProtocol, navigation: UINavigationController) {
        tabBarController = UITabBarController()
        self.resolver = resolver
        super.init(navigation: navigation)
    }
    
    override func start() {
        let peopleNavigation = UINavigationController()
        let peopleCoordinator = PeopleCoordinator(resolver, navigation: peopleNavigation)
        addChild(peopleCoordinator)
        peopleCoordinator.start()
        
        let roomsNavigation = UINavigationController()
        let roomsCoordinator = RoomsCoordinator(resolver, navigation: roomsNavigation)
        addChild(roomsCoordinator)
        roomsCoordinator.start()
        
        tabBarController.viewControllers = [peopleNavigation, roomsNavigation]
        
        navigation.pushViewController(tabBarController, animated: false)
    }
}
