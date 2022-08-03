//
//  RoomsViewModel.swift
//  
//
//  Created by Dmytro Vorko on 03.08.2022.
//

import Foundation
import MVVM
import UseCases

public struct RoomsViewModel: ViewModel {
    // MARK: - Nested
    
    public struct Input {
        
    }
    
    public struct Output {
        
    }
    
    // MARK: - Properties
    
    private let companyUseCase: CompanyUseCaseProtocol
    
    // MARK: - Constructor
    
    public init(_ companyUseCase: CompanyUseCaseProtocol) {
        self.companyUseCase = companyUseCase
    }
    
    // MARK: - Bind
    
    public func bind(input: Input) -> Output {
        .init()
    }
}
