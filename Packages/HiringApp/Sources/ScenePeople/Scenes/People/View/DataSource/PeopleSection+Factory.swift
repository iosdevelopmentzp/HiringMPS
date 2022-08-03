//
//  PeopleSection+Factory.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

extension PeopleSection {
    struct Factory {
        static func make(_ state: PeopleState) -> [PeopleSection] {
            let section: PeopleSection
            switch state {
            case .idle, .loading:
                section = .init(.single, items: [.loading])
                
            case .loaded(let models):
                section = .init(.main, items: models.map { PeopleSectionItem.model($0) })
                
            case .error(let message):
                section = .init(.single, items: [.error(message)])
            }
            return [section]
        }
    }
}

