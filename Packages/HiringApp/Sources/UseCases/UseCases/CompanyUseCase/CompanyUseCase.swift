//
//  CompanyUseCase.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import RxSwift
import RxCocoa
import Networking
import Core

final class CompanyUseCase {
    private let networking: CompanyNetworkServiceType
    
    init(_ networking: CompanyNetworkServiceType) {
        self.networking = networking
    }
}

// MARK: - CompanyUseCaseProtocol

extension CompanyUseCase: CompanyUseCaseProtocol {
    func setupRooms() -> Single<[Room]> {
        networking
            .loadRooms()
            .map {
                $0.map(RoomBuilder.make(_:))
            }
    }
    
    func setupPeople() -> Single<[Employee]> {
        networking
            .loadPeople()
            .map {
                $0.map(EmployeeBuilder.make(_:))
            }
    }
}
