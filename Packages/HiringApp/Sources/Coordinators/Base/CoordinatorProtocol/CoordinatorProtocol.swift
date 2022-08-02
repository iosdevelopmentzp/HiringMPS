//
//  CoordinatorProtocol.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public protocol CoordinatorProtocol: AnyObject {
    var children: [CoordinatorProtocol] { get }
    
    func start()
    func addChild(_ child: CoordinatorProtocol)
    func childDidFinish(_ child: CoordinatorProtocol)
}
