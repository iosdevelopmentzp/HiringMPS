//
//  AppTabBarViewController.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import UIKit
import Animators

public final class AppTabBarViewController: UITabBarController {
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        self.delegate  = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITabBarControllerDelegate

extension AppTabBarViewController: UITabBarControllerDelegate {
    public func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return TabBarControllerTransition(viewControllers: tabBarController.viewControllers)
    }
}
