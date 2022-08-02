//
//  Employee.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public struct Employee: Equatable {
    // MARK: - Properties
    
    public let id: String
    public let created: Date?
    public let firstName: String?
    public let lastName: String?
    public let avatarLink: String?
    public let email: String?
    public let jobTitle: String?
    public let favoriteColor: String?
    
    // MARK: - Constructor
    
    public init(
        id: String,
        created: Date?,
        firstName: String?,
        lastName: String?,
        avatarLink: String?,
        email: String?,
        jobTitle: String?,
        favoriteColor: String?
    ) {
        self.id = id
        self.created = created
        self.firstName = firstName
        self.lastName = lastName
        self.avatarLink = avatarLink
        self.email = email
        self.jobTitle = jobTitle
        self.favoriteColor = favoriteColor
    }
}
