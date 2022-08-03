//
//  PeopleCellModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

struct PeopleCellModel: Hashable {
    public let id: String
    public let fullName: String?
    public let avatarLink: String?
    public let email: String?
    public let jobTitle: String?
    public let favoriteColor: String?
}
