//
//  UseCasesAssembly.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import UseCases
import Swinject
import Networking

struct UseCasesAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UseCasesFactoryProtocol.self) { _ in
            UseCasesFactory()
        }.inObjectScope(.container)
        
        container.register(CompanyUseCaseProtocol.self) { resolver in
            guard
                let factory = resolver.resolve(UseCasesFactoryProtocol.self),
                let companyNetwork = resolver.resolve(CompanyNetworkServiceType.self)
            else {
                fatalError("Failed UseCasesFactoryProtocol resolving attempt")
            }
            
            return factory.company(companyNetwork)
        }
    }
}
