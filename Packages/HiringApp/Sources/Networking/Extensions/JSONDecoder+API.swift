//
//  JSONDecoder+API.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

extension JSONDecoder {
    static let api: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.api)
        return decoder
    }()
}
