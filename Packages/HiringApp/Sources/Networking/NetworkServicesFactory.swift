//
//  NetworkServicesFactory.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public protocol NetworkServicesFactoryType {
    var companyService: CompanyNetworkServiceType { get }
}

public final class NetworkServicesFactory {
    // MARK: - Properties
    
    private let configuration: NetworkApiConfigurationProtocol

    // MARK: - Constructor
    
    public init(configuration: NetworkApiConfigurationProtocol) {
        self.configuration = configuration
    }
}

// MARK: - NetworkServicesFactoryType

extension NetworkServicesFactory: NetworkServicesFactoryType {
    public var companyService: CompanyNetworkServiceType {
        CompanyNetworkService(
            network: Networking(),
            host: configuration.host,
            apiVersion: configuration.apiVersion
        )
    }
}
