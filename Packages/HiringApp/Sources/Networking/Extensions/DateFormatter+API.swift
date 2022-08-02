//
//  DateFormatter+API.swift
//  
//
//  Created by Dmytro Vorko on 02.08.2022.
//

import Foundation

extension DateFormatter {
    static let api: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
}
