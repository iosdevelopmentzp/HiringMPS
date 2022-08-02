//
//  Room.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public struct Room: Equatable {
    // MARK: - Properties
    
    public let id: String
    public let created: Date?
    public let isOccupied: Bool?
    public let maxOccupancy: Int?
    
    // MARK: - Constructor
    
    public init(id: String, created: Date?, isOccupied: Bool?, maxOccupancy: Int?) {
        self.id = id
        self.created = created
        self.isOccupied = isOccupied
        self.maxOccupancy = maxOccupancy
    }
}
