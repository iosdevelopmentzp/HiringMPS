//
//  Array+EmployeeSort.swift
//  
//
//  Created by Dmytro Vorko on 04.08.2022.
//

import Foundation
import Core

extension Array where Element == Employee {
    func sorted() -> Self {
        self.sorted(by: {
            guard let firstJob = $0.jobTitle, let secondJob = $1.jobTitle else {
                return $0.id < $1.id
            }
            return firstJob < secondJob
        })
    }
}
