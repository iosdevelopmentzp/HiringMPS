//
//  RoomCellModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

struct RoomCellModel: Hashable {
    let id: String
    let isOccupied: Bool
    let maxOccupancy: Int?
    let createdDate: String?
    
    var bottomText: String {
        [
            maxOccupancy.map { "Occupancy: \($0)" },
            createdDate.map { "Created: \($0)" }
        ]
            .compactMap { $0 }
            .joined(separator: "\n")
    }
}
