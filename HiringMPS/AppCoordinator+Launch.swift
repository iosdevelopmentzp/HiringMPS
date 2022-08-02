//
//  AppCoordinator+Launch.swift
//  HiringMPS
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Coordinators
import UIKit

extension AppCoordinator {
    static func launch(with window: UIWindow) -> AppCoordinator {
        return AppCoordinator(window: window)
    }
}
