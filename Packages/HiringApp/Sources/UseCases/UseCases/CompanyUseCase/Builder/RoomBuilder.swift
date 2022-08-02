//
//  RoomBuilder.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Core

struct RoomBuilder {
    static func make(_ dto: RoomDTO) -> Room {
        .init(
            id: dto.id,
            created: dto.createdAt,
            isOccupied: dto.isOccupied,
            maxOccupancy: dto.maxOccupancy
        )
    }
}
