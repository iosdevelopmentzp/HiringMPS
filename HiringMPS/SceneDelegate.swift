//
//  SceneDelegate.swift
//  HiringMPS
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import UIKit
import Coordinators

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
        let appCoordinator = AppCoordinator.launch(with: window)
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.window = window
        appDelegate?.appCoordinator = appCoordinator
        
        appCoordinator.start()
    }
}

