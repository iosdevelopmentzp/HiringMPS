//
//  EmployeeBuilder.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Core

struct EmployeeBuilder {
    static func make(_ dto: EmployeeDTO) -> Employee {
        .init(
            id: dto.id,
            created: dto.createdAt,
            firstName: dto.firstName,
            lastName: dto.lastName,
            avatarLink: dto.avatar,
            email: dto.email,
            jobTitle: dto.jobtitle,
            favoriteColor: dto.favouriteColor
        )
    }
}
