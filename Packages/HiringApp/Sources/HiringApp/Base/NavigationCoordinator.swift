//
//  NavigationCoordinator.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import UIKit

open class NavigationCoordinator: CoordinatorProtocol {
    // MARK: - Properties
    
    let navigation: UINavigationController
    public private(set) var children: [CoordinatorProtocol] = []
    
    // MARK: - Constructor
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    // MARK: - Functions
    
    public func start() {
        fatalError("This method must be overridden")
    }
    
    public func addChild(_ child: CoordinatorProtocol) {
        children.append(child)
    }
    
    public func childDidFinish(_ child: CoordinatorProtocol) {
        children = children.filter { $0 !== child }
    }
}
