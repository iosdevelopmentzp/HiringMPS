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
    let items: [SingleSectionItem]
    
    init(original: RoomsSection, items: [SingleSectionItem]) {
        self = .init(original.type, items: items)
    }
    
    init(_ type: SectionType, items: [SingleSectionItem]) {
        self.type = type
        self.items = items
    }
}

enum SingleSectionItem: Hashable {
    case loading
    case error(_ message: String)
    case model(_ model: RoomCellModel)
}
