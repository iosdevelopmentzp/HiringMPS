//
//  Images.swift
//  
//
//  Created by Dmytro Vorko on 04.08.2022.
//

import Foundation
import UIKit

public protocol ImageConvertableType {
    var image: UIImage? { get } // Should be not optional
}

extension ImageConvertableType where Self: RawRepresentable, Self.RawValue == String {
    public var image: UIImage? {
        if #available(iOS 13.0, *) {
            return UIImage(systemName: self.rawValue)
        } else {
            // TODO: - Provide correct image for ios 12 and early
            return UIImage(named: self.rawValue)
        }
    }
}

public struct Images {
    // Here will be app images
    // Some framework should be used for automatic generation (Swiftgen, R.swift or similar.)
    
    public enum AppTabBar: String, ImageConvertableType {
        case peopleTabFilled = "person.3.sequence.fill"
        case peopleTab = "person.3.sequence"
        case roomsTabFilled = "building.columns.fill"
        case roomsTab = "building.columns"
    }
}
