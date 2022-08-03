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
    }
}

// MARK: - Private

private extension TabBarCoordinator {
    enum TabType: CaseIterable {
        case people
        case rooms
        
        var tag: Int {
            guard let index = TabType.allCases.firstIndex(of: self) else {
                fatalError("Unexpected behaviour")
            }
            return index
        }
    }
    
    private func makeTabViewControllers()  -> [UIViewController] {
        TabType.allCases.map {
            let navigation = UINavigationController()
            let coordinator = self.coordinator(for: $0, navigation: navigation)
            coordinator.start()
            navigation.viewControllers.first?.tabBarItem = tabItem(for: $0)
            return navigation.viewControllers.first
        }
        .compactMap { $0 }
    }
    
    private func tabItem(for tabType: TabType) -> UITabBarItem {
        let title: String
        switch tabType {
        case .people:
            title = "People"

        case .rooms:
            title = "Rooms"
        }
        
        let item = UITabBarItem(title: title, image: .init(), tag: tabType.tag)
        item.setTitleTextAttributes(
            [
                .font: UIFont.systemFont(ofSize: 17),
                .foregroundColor: UIColor.red
            ],
            for: .normal
        )
        
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
