//
//  Collection+SafeSubscript.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
