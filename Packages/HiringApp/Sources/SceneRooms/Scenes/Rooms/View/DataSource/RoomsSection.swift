//
//  RoomsSection.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import RxDataSources

struct RoomsSection: Hashable, SectionModelType {
    enum SectionType {
        case single
        case main
    }
    
    let type: SectionType
    let items: [RoomsSectionItem]
    
    init(original: RoomsSection, items: [RoomsSectionItem]) {
        self = .init(original.type, items: items)
    }
    
    init(_ type: SectionType, items: [RoomsSectionItem]) {
        self.type = type
        self.items = items
    }
}

enum RoomsSectionItem: Hashable {
    case loading
    case error(_ message: String)
    case model(_ model: RoomCellModel)
}
