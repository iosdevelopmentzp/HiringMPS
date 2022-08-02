//
//  CompanyNetworkService.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import RxSwift
import RxCocoa
import Core

public protocol CompanyNetworkServiceType {
    func loadPeople() -> Single<[EmployeeDTO]>
    func loadRooms() -> Single<[RoomDTO]>
}

final class CompanyNetworkService {
    // MARK: - Properties
    
    private let network: Networking
    private let targetFactory: TargetFactory<CompanyTarget>
    
    // MARK: - Constructor
    
    init(network: Networking, host: String, apiVersion: String) {
        self.network = network
        self.targetFactory = .init(host: host, apiVersion: apiVersion)
    }
}

// MARK: - SpaceCompanyNetworkServiceType

extension CompanyNetworkService: CompanyNetworkServiceType {
    func loadPeople() -> Single<[EmployeeDTO]> {
        let target = targetFactory.make(endpoint: .people)
        return network.perform(target: target)
    }
    
    func loadRooms() -> Single<[RoomDTO]> {
        let target = targetFactory.make(endpoint: .rooms)
        return network.perform(target: target)
    }
}
