//
//  RoomCellModel+Factory.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import Core

extension RoomCellModel {
    struct Factory {
        private static let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = .current
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            return dateFormatter
        }()
        
        static func make(from room: Room) -> RoomCellModel {
            .init(
                id: room.id,
                isOccupied: room.isOccupied ?? false,
                maxOccupancy: room.maxOccupancy,
                createdDate: room.created.map { dateFormatter.string(from: $0) }
            )
        }
    }
}
