//
//  PeopleState.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

enum PeopleState: Equatable {
    case idle
    case loading
    case loaded(models: [PeopleCellModel])
    case error(_ message: String)
}
