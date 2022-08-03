//
//  PeopleSection.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import RxDataSources

struct PeopleSection: Hashable, SectionModelType {
    enum SectionType {
        case single
        case main
    }
    
    let type: SectionType
    let items: [PeopleSectionItem]
    
    init(original: PeopleSection, items: [PeopleSectionItem]) {
        self = .init(original.type, items: items)
    }
    
    init(_ type: SectionType, items: [PeopleSectionItem]) {
        self.type = type
        self.items = items
    }
}

enum PeopleSectionItem: Hashable {
    case loading
    case error(_ message: String)
    case model(_ model: PeopleCellModel)
}

