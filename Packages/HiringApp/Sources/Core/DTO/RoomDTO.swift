//
//  RoomDTO.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

public struct RoomDTO: Decodable, Equatable {
    public let id: String
    public let createdAt: Date?
    public let isOccupied: Bool?
    public let maxOccupancy: Int?
}
