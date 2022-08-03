//
//  PeopleCellModel+Factory.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import Core

extension PeopleCellModel {
    struct Factory {
        static func make(from employee: Employee) -> PeopleCellModel {
            .init(
                id: employee.id,
                fullName: [employee.firstName, employee.lastName].compactMap { $0 }.joined(separator: " "),
                avatarLink: employee.avatarLink,
                email: employee.email,
                jobTitle: employee.jobTitle,
                favoriteColor: employee.favoriteColor
            )
        }
    }
}
