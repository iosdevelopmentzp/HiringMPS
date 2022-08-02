//
//  ViewModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func bind(input: Input) -> Output
}
