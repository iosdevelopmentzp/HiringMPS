//
//  NetworkApiConfigurationProtocol.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public protocol NetworkApiConfigurationProtocol {
    var host: String { get }
    var apiVersion: String { get }
}
