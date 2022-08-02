//
//  APIConfiguration.swift
//  HiringMPS
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import Networking

struct APIConfiguration: PlistDecodableType, NetworkApiConfigurationProtocol {
    let host: String
    let apiVersion: String
}
