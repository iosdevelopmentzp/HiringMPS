//
//  UseCasesFactory.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Networking

public protocol UseCasesFactoryProtocol {
    func company(_ networking: CompanyNetworkServiceType) -> CompanyUseCaseProtocol
}

public class UseCasesFactory {
    public init() {}
}

extension UseCasesFactory: UseCasesFactoryProtocol {
    public func company(_ networking: CompanyNetworkServiceType) -> CompanyUseCaseProtocol {
        CompanyUseCase(networking)
    }
}
