//
//  EmployeeDTO.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public struct EmployeeDTO: Decodable, Equatable {
    public let id: String
    public let createdAt: Date?
    public let firstName: String?
    public let lastName: String?
    public let avatar: String?
    public let email: String?
    public let jobtitle: String?
    public let favouriteColor: String?
}
