//
//  UIViewController+LifeCycle.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import RxSwift
import RxCocoa
import UIKit

public extension Reactive where Base: UIViewController {
    var viewWillAppear: ControlEvent<Void> {
        let event = methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { _ in () }
        return ControlEvent(events: event)
    }
}
