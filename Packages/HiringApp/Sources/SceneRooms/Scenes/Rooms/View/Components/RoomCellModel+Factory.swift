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
        static func make(from room: Room) -> RoomCellModel {
            .init(title: room.id)
        }
    }
}
