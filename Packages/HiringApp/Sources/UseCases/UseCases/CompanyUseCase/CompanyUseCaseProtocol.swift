//
//  CompanyUseCaseProtocol.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation
import RxSwift
import Core

public protocol CompanyUseCaseProtocol {
    func setupPeople() -> Single<[Employee]>
    func setupRooms() -> Single<[Room]>
}
