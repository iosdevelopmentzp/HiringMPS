//
//  TabBarCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import DependencyResolver
import Animators
import SharedViews
import AppDesign

final class TabBarCoordinator: NavigationCoordinator {
    // MARK: - Properties
    
    private let tabBarController: AppTabBarViewController
    private let resolver: DependencyResolverProtocol
    
    // MARK: - Constructor
    
    init(_ resolver: DependencyResolverProtocol, navigation: UINavigationController) {
        tabBarController = AppTabBarViewController()
        self.resolver = resolver
        super.init(navigation: navigation)
    }
    
    // MARK: - Start
    
    override func start() {
        tabBarController.viewControllers = makeTabViewControllers()
        navigation.pushViewController(tabBarController, animated: false)
        tabBarController.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Private

private extension TabBarCoordinator {
    enum TabType: Int, CaseIterable {
        case people
        case rooms
    }
    
    private func makeTabViewControllers()  -> [UIViewController] {
        TabType.allCases.map {
            let navigation = UINavigationController()
            let coordinator = self.coordinator(for: $0, navigation: navigation)
            coordinator.start()
            navigation.viewControllers.first?.tabBarItem = tabItem(for: $0)
            return navigation
        }
        .compactMap { $0 }
    }
    
    private func tabItem(for tabType: TabType) -> UITabBarItem {
        let image: UIImage?
        
        switch tabType {
        case .people:
            image = Images.AppTabBar.peopleTab.image

        case .rooms:
            image = Images.AppTabBar.roomsTab.image
        }
        
        let item = UITabBarItem(title: nil, image: image, tag: tabType.rawValue)
        return item
    }
    
    private func coordinator(for tabType: TabType, navigation: UINavigationController) -> CoordinatorProtocol {
        switch tabType {
        case .people:
            return PeopleCoordinator(resolver, navigation: navigation)
        
        case .rooms:
            return RoomsCoordinator(resolver, navigation: navigation)
        }
    }
}
