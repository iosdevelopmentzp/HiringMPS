//
//  RoomsState.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

enum RoomsState: Equatable {
    case idle
    case loading
    case loaded(models: [RoomCellModel])
    case error(_ message: String)
}
